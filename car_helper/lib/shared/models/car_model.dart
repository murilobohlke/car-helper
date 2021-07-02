
import 'package:car_helper/shared/models/refueling_model.dart';

class CarModel {
  final String? id;
  final String? model;
  final String? brand;
  final String? image;
  final String? nick;
  final List<RefuelingModel>? refuelings;

  CarModel({
    this.id,
    this.model,
    this.brand,
    this.image,
    this.nick,
    this.refuelings
  });
      
  CarModel copyWith({
    String? id,
    String? model,
    String? brand,
    String? image,
    String? nick,
    List<RefuelingModel>? refuelings,
  }) {
    return CarModel(
      id: id ?? this.id,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      image: image ?? this.image,
      nick: nick ?? this.nick,
      refuelings: refuelings ?? this.refuelings,
    );
  }

 
}
