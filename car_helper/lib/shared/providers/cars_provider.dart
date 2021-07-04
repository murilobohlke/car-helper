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

    var index = cars.indexOf(car);

    cars.removeAt(index);
    cars.insert(index, car);

    //DbUtil.delete('cars', car.id!);

    // DbUtil.insert('cars', {
    //   'id': car.id!,
    //   'brand': car.brand!,
    //   'image': car.image!,
    //   'model': car.model!,
    //   'nick': car.nick!,
    //   'refuelings':jsonEncode(car.refuelings!)
    // });
    notifyListeners();
  }

  Future<void> addPhoto(String image, CarModel car) async {

    if (car.images == null) {
      car.images = [];
    }

    car.images!.add(image);

    var index = cars.indexOf(car);

    cars.removeAt(index);
    cars.insert(index, car);

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
