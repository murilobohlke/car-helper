import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:car_helper/shared/models/refueling_model.dart';

class CarModel {
  final String? id;
  final String? model;
  final String? brand;
  final String? image;
  final String? nick;
  List<RefuelingModel>? refuelings;
  List<String>? images;

  CarModel({
    this.id,
    this.model,
    this.brand,
    this.image,
    this.nick,
    this.refuelings,
    this.images
  });

  CarModel copyWith({
    String? id,
    String? model,
    String? brand,
    String? image,
    String? nick,
    List<RefuelingModel>? refuelings,
    List<String>? images,
  }) {
    return CarModel(
      id:id ?? this.id,
      model:model ?? this.model,
      brand:brand ?? this.brand,
      image:image ?? this.image,
      nick:nick ?? this.nick,
      refuelings:refuelings ?? this.refuelings,
      images:images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'model': model,
      'brand': brand,
      'image': image,
      'nick': nick,
      'refuelings': refuelings?.map((x) => x.toMap()).toList(),
      'images': images,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: map['id'],
      model:map['model'],
      brand:map['brand'],
      image:map['image'],
      nick:map['nick'],
      refuelings:List<RefuelingModel>.from(map['refuelings']?.map((x) => RefuelingModel.fromMap(x))),
      images:List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) => CarModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarModel(id: $id, model: $model, brand: $brand, image: $image, nick: $nick, refuelings: $refuelings, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CarModel &&
      other.id == id &&
      other.model == model &&
      other.brand == brand &&
      other.image == image &&
      other.nick == nick &&
      listEquals(other.refuelings, refuelings) &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      model.hashCode ^
      brand.hashCode ^
      image.hashCode ^
      nick.hashCode ^
      refuelings.hashCode ^
      images.hashCode;
  }
}
