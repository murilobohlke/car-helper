import 'dart:convert';
import 'dart:math';

import 'package:car_helper/shared/db/db_util.dart';
import 'package:car_helper/shared/models/calibragem_model.dart';
import 'package:car_helper/shared/models/car_model.dart';
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

    cars = dataList.map((item) {
      r = [];
      imgs = [];
      cal = [];

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

      return CarModel(
          id: item['id'],
          image: item['image'],
          brand: item['brand'],
          model: item['model'],
          nick: item['nick'],
          refuelings: r,
          images: imgs,
          calibragens: cal,
          oils: [
            // OilModel(
            //     date: '12/06/2021',
            //     odometer: '97.897',
            //     oil: '5W30',
            //     value: 137.7,
            //     oilFilter: true,
            //     airFilter: false,
            //     gasFilter: false,
            //     airCFilter: false),
            // OilModel(
            //     date: '07/01/2021',
            //     odometer: '92.345',
            //     oil: '5W30',
            //     value: 147.7,
            //     oilFilter: true,
            //     airFilter: true,
            //     gasFilter: false,
            //     airCFilter: false),
          ],
          others: []);
    }).toList();

    notifyListeners();
  }

  Future<void> addCalibragem(String date, double libras, CarModel car) async {
    final newCalibragem = CalibragemModel(date: date, libras: libras);

    car.calibragens!.add(newCalibragem);

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
          'calibragens': jsonEncode(car.calibragens)
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

    car.refuelings!.add(newRefueling);

    DbUtil.update(
        'cars',
        {
          'id': car.id!,
          'brand': car.brand!,
          'image': car.image!,
          'model': car.model!,
          'nick': car.nick!,
          'refuelings': jsonEncode(car.refuelings!),
          'images': jsonEncode(car.images!)
        },
        car.id!);

    notifyListeners();
  }

  Future<void> addPhoto(String image, CarModel car) async {
    car.images!.add(image);

    if (car.refuelings == null) {
      DbUtil.update(
          'cars',
          {
            'id': car.id!,
            'brand': car.brand!,
            'image': car.image!,
            'model': car.model!,
            'nick': car.nick!,
            'images': jsonEncode(car.images!)
          },
          car.id!);
    } else {
      DbUtil.update(
          'cars',
          {
            'id': car.id!,
            'brand': car.brand!,
            'image': car.image!,
            'model': car.model!,
            'nick': car.nick!,
            'refuelings': jsonEncode(car.refuelings!),
            'images': jsonEncode(car.images!)
          },
          car.id!);
    }

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
      'others':''
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
        images: car.images);

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
          'images': jsonEncode(car.images!)
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
          'images': jsonEncode(car.images!)
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
