import 'dart:convert';
import 'dart:math';

import 'package:car_helper/shared/db/db_util.dart';
import 'package:car_helper/shared/models/calibragem_model.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/models/oil_model.dart';
import 'package:car_helper/shared/models/other_maintenance_model.dart';
import 'package:car_helper/shared/models/refueling_model.dart';
import 'package:flutter/cupertino.dart';

class CarsProvider with ChangeNotifier {
  // final List<CarModel> cars = DUMMY_CARS;
  List<CarModel> cars = [];

  Future<void> loadCars() async {
    final dataList = await DbUtil.getData('cars');
    List<RefuelingModel>? r;
    List<String>? imgs;
    List<CalibragemModel>? cal;
    List<OilModel>? oil;
    List<OtherMaintenanceModel>? other;

    cars = dataList.map((item) {
      r = [];
      imgs = [];
      cal = [];
      oil = [];
      other = [];

      if (item['images'] != '') {
        imgs = (jsonDecode(item['images']) as List<dynamic>).cast<String>();
      }

      if (item['refuelings'] != '') {
        Iterable l = json.decode(item['refuelings']);
        r = List<RefuelingModel>.from(
            l.map((model) => RefuelingModel.fromJson(model)));
      }

      if (item['calibragens'] != '') {
        Iterable l = json.decode(item['calibragens']);
        cal = List<CalibragemModel>.from(
            l.map((model) => CalibragemModel.fromJson(model)));
      }

      if (item['oils'] != '') {
        Iterable l = json.decode(item['oils']);
        oil = List<OilModel>.from(l.map((model) => OilModel.fromJson(model)));
      }

      if (item['others'] != '') {
        Iterable l = json.decode(item['others']);
        other = List<OtherMaintenanceModel>.from(
            l.map((model) => OtherMaintenanceModel.fromJson(model)));
      }

      return CarModel(
          id: item['id'],
          image: item['image'],
          brand: item['brand'],
          model: item['model'],
          nick: item['nick'],
          refuelings: r,
          images: imgs,
          calibragens: cal,
          oils: oil,
          others: other);
    }).toList();

    notifyListeners();
  }

  Future<void> addCalibragem(String date, double libras, CarModel car) async {
    final newCalibragem = CalibragemModel(date: date, libras: libras);

    var index = cars.indexOf(car);

    car.calibragens!.add(newCalibragem);

    cars[index].calibragens = car.calibragens!;

    await DbUtil.update(
        'cars',
        {
          'id': car.id!,
          'brand': car.brand!,
          'image': car.image!,
          'model': car.model!,
          'nick': car.nick!,
          'refuelings': jsonEncode(car.refuelings),
          'images': jsonEncode(car.images),
          'calibragens': jsonEncode(car.calibragens),
          'oils': jsonEncode(car.oils),
          'others': jsonEncode(car.others)
        },
        car.id!);

    notifyListeners();
  }

  Future<void> addOther(String date, String odometer, String title,
      String description, double total, CarModel car) async {
    final newOther = OtherMaintenanceModel(
        date: date,
        odometer: odometer,
        description: description,
        total: total,
        title: title);
    
    var index = cars.indexOf(car);

    car.others!.add(newOther);

    cars[index].others = car.others!;

    await DbUtil.update(
        'cars',
        {
          'id': car.id!,
          'brand': car.brand!,
          'image': car.image!,
          'model': car.model!,
          'nick': car.nick!,
          'refuelings': jsonEncode(car.refuelings),
          'images': jsonEncode(car.images),
          'calibragens': jsonEncode(car.calibragens),
          'oils': jsonEncode(car.oils),
          'others': jsonEncode(car.others)
        },
        car.id!);

    notifyListeners();
  }

  Future<void> addOil(
      String date,
      String odometer,
      String oil,
      double value,
      bool oilFilter,
      bool airFilter,
      bool gasFilter,
      bool airCFilter,
      CarModel car) async {
    final newOil = OilModel(
        date: date,
        odometer: odometer,
        oil: oil,
        value: value,
        oilFilter: oilFilter,
        airFilter: airFilter,
        gasFilter: gasFilter,
        airCFilter: airCFilter);
    
    var index = cars.indexOf(car);

    car.oils!.add(newOil);

    cars[index].oils = car.oils!;

    await DbUtil.update(
        'cars',
        {
          'id': car.id!,
          'brand': car.brand!,
          'image': car.image!,
          'model': car.model!,
          'nick': car.nick!,
          'refuelings': jsonEncode(car.refuelings),
          'images': jsonEncode(car.images),
          'calibragens': jsonEncode(car.calibragens),
          'oils': jsonEncode(car.oils),
          'others': jsonEncode(car.others)
        },
        car.id!);

    notifyListeners();
  }

  Future<void> addRefueling(String date, String hour, String odometer,
      String type, double price, double total, CarModel car) async {
    final newRefueling = RefuelingModel(
        date: date,
        hour: hour,
        odometer: odometer,
        type: type,
        price: price,
        total: total);
    
    var index = cars.indexOf(car);

    car.refuelings!.add(newRefueling);

    cars[index].refuelings = car.refuelings!;

    DbUtil.update(
        'cars',
        {
          'id': car.id!,
          'brand': car.brand!,
          'image': car.image!,
          'model': car.model!,
          'nick': car.nick!,
          'refuelings': jsonEncode(car.refuelings),
          'images': jsonEncode(car.images),
          'calibragens': jsonEncode(car.calibragens),
          'oils': jsonEncode(car.oils),
          'others': jsonEncode(car.others)
        },
        car.id!);

    notifyListeners();
  }

  Future<void> addPhoto(String image, CarModel car) async {
    var index = cars.indexOf(car);
    car.images!.add(image);

    cars[index].images = car.images!;

    DbUtil.update(
        'cars',
        {
          'id': car.id!,
          'brand': car.brand!,
          'image': car.image!,
          'model': car.model!,
          'nick': car.nick!,
          'refuelings': jsonEncode(car.refuelings),
          'images': jsonEncode(car.images),
          'calibragens': jsonEncode(car.calibragens),
          'oils': jsonEncode(car.oils),
          'others': jsonEncode(car.others)
        },
        car.id!);

    notifyListeners();
  }

  Future<void> addCar(
      String brand, String model, String image, String nick) async {
    final newCar = CarModel(
        id: Random().nextDouble().toString(),
        image: image,
        brand: brand,
        model: model,
        nick: nick,
        refuelings: [],
        images: [],
        calibragens: [],
        oils: [],
        others: []);

    cars.add(newCar);

    DbUtil.insert('cars', {
      'id': newCar.id!,
      'brand': newCar.brand!,
      'image': newCar.image!,
      'model': newCar.model!,
      'nick': newCar.nick!,
      'refuelings': '',
      'images': '',
      'calibragens': '',
      'oils': '',
      'others': ''
    });
    notifyListeners();
  }

  Future<void> updateCar(
      String brand, String model, String image, String nick, String id) async {
    CarModel car = cars.firstWhere((car) => car.id == id);

    final newCar = CarModel(
        id: id,
        image: image,
        brand: brand,
        model: model,
        nick: nick,
        refuelings: car.refuelings,
        images: car.images,
        calibragens: car.calibragens,
        oils: car.oils,
        others: car.others);

    var index = cars.indexOf(car);

    cars.removeAt(index);
    cars.insert(index, newCar);

    DbUtil.update(
        'cars',
        {
          'id': newCar.id!,
          'brand': newCar.brand!,
          'image': newCar.image!,
          'model': newCar.model!,
          'nick': newCar.nick!,
          'refuelings': jsonEncode(car.refuelings!),
          'images': jsonEncode(car.images!),
          'calibragens': jsonEncode(car.calibragens!),
          'oils': jsonEncode(car.oils!),
          'others': jsonEncode(car.others!)
        },
        id);
    notifyListeners();
  }

  Future<void> deleteCar(String id) async {
    cars.removeWhere((element) => element.id == id);

    DbUtil.delete('cars', id);

    notifyListeners();
  }

  Future<void> deleteRefueling(RefuelingModel r, String id) async {
    CarModel car = cars.firstWhere((car) => car.id == id);

    var index = cars.indexOf(car);

    cars[index].refuelings!.remove(r);

    DbUtil.update(
        'cars',
        {
          'id': car.id!,
          'brand': car.brand!,
          'image': car.image!,
          'model': car.model!,
          'nick': car.nick!,
          'refuelings': jsonEncode(car.refuelings!),
          'images': jsonEncode(car.images!),
          'calibragens': jsonEncode(car.calibragens!),
          'oils': jsonEncode(car.oils!),
          'others': jsonEncode(car.others!)
        },
        car.id!);

    notifyListeners();
  }

  Future<void> deleteMaintenance(model, String id) async {
    CarModel car = cars.firstWhere((car) => car.id == id);

    var index = cars.indexOf(car);

    if (model is CalibragemModel) {
      cars[index].calibragens!.remove(model);
    }

    if (model is OilModel) {
      cars[index].oils!.remove(model);
    }

    if (model is OtherMaintenanceModel) {
      cars[index].others!.remove(model);
    }
    DbUtil.update(
        'cars',
        {
          'id': car.id!,
          'brand': car.brand!,
          'image': car.image!,
          'model': car.model!,
          'nick': car.nick!,
          'refuelings': jsonEncode(car.refuelings!),
          'images': jsonEncode(car.images!),
          'calibragens': jsonEncode(car.calibragens!),
          'oils': jsonEncode(car.oils!),
          'others': jsonEncode(car.others!)
        },
        car.id!);

    notifyListeners();
  }

  Future<void> deleteImage(String s, String id) async {
    CarModel car = cars.firstWhere((car) => car.id == id);

    var index = cars.indexOf(car);

    cars[index].images!.remove(s);

    DbUtil.update(
        'cars',
        {
          'id': car.id!,
          'brand': car.brand!,
          'image': car.image!,
          'model': car.model!,
          'nick': car.nick!,
          'refuelings': jsonEncode(car.refuelings!),
          'images': jsonEncode(car.images!),
          'calibragens': jsonEncode(car.calibragens!),
          'oils': jsonEncode(car.oils!),
          'others': jsonEncode(car.others!)
        },
        car.id!);

    notifyListeners();
  }

  List<CarModel> get items {
    return [...cars];
  }

  int get itemsCount {
    return cars.length;
  }

  CarModel itemByIndex(int index) {
    return cars[index];
  }

  CarModel itemById(String id) {
    return cars.firstWhere((car) => car.id == id);
  }
}
