import 'dart:io';
import 'dart:math';

import 'package:car_helper/shared/db/db_util.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:flutter/cupertino.dart';

class HomePageController with ChangeNotifier {
  // final List<CarModel> cars = DUMMY_CARS;
  List<CarModel> cars = [];

  Future<void> loadCars() async {
    final dataList = await DbUtil.getData('cars');
    cars = dataList
        .map((item) => CarModel(
              id: item['id'],
              image: item['image'],
              brand: item['brand'],
              model: item['model'],
              nick: item['nick'],
            ))
        .toList();
    notifyListeners();
  }

  Future<void> addCar(
      String brand, String model, String image, String nick) async {
    print('ihhhu');
    final newCar = CarModel(
        id: Random().nextDouble().toString(),
        image: image,
        brand: brand,
        model: model,
        nick: nick);

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

  List<CarModel> get items {
    return [...cars];
  }

  int get itemsCount {
    return cars.length;
  }

  CarModel itemByIndex(int index) {
    return cars[index];
  }
}
