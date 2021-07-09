import 'dart:convert';
import 'dart:math';

import 'package:car_helper/shared/db/db_util.dart';
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

    cars = dataList.map((item) {
      r = null;
      imgs = null;

      if (item['images'] != null) {
        imgs = (jsonDecode(item['images']) as List<dynamic>).cast<String>();

        print(imgs);
      }

      if (item['refuelings'] != null) {
        Iterable l = json.decode(item['refuelings']);
        r = List<RefuelingModel>.from(
            l.map((model) => RefuelingModel.fromJson(model)));
      }

      return CarModel(
          id: item['id'],
          image: item['image'],
          brand: item['brand'],
          model: item['model'],
          nick: item['nick'],
          refuelings: r,
          images: imgs);
    }).toList();

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

    if (car.refuelings == null) {
      car.refuelings = [];
    }

    car.refuelings!.add(newRefueling);

    if (car.images == null) {
      DbUtil.update(
      'cars',
      {
        'id': car.id!,
        'brand': car.brand!,
        'image': car.image!,
        'model': car.model!,
        'nick': car.nick!,
        'refuelings': jsonEncode(car.refuelings!),
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

  Future<void> addPhoto(String image, CarModel car) async {
    if (car.images == null) {
      car.images = [];
    }

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
    );

    cars.add(newCar);

    DbUtil.insert('cars', {
      'id': newCar.id!,
      'brand': newCar.brand!,
      'image': newCar.image!,
      'model': newCar.model!,
      'nick': newCar.nick!,
    });
    notifyListeners();
  }

  Future<void> updateCar(
      String brand, String model, String image, String nick, String id) async {
    final newCar = CarModel(
      id: id,
      image: image,
      brand: brand,
      model: model,
      nick: nick,
    );

    CarModel car = cars.firstWhere((car) => car.id == id);

    var index = cars.indexOf(car);

    print(index);

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
          'images': jsonEncode(car.images!)
        },
        id);
    notifyListeners();
  }

  Future<void> deleteCar(String id) async {
    cars.removeWhere((element) => element.id == id);

    DbUtil.delete('cars', id);

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
