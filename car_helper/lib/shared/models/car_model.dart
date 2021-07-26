import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:car_helper/shared/models/calibragem_model.dart';
import 'package:car_helper/shared/models/oil_model.dart';
import 'package:car_helper/shared/models/other_maintenance_model.dart';
import 'package:car_helper/shared/models/refueling_model.dart';

class CarModel {
  final String? id;
  final String? model;
  final String? brand;
  final String? image;
  final String? nick;
  List<RefuelingModel>? refuelings;
  List<String>? images;
  List<CalibragemModel>? calibragens;
  List<OilModel>? oils;
  List<OtherMaintenanceModel>? others;

  CarModel({
    this.id,
    this.model,
    this.brand,
    this.image,
    this.nick,
    this.refuelings,
    this.images,
    this.calibragens,
    this.oils,
    this.others,
  });

  CarModel copyWith({
    String? id,
    String? model,
    String? brand,
    String? image,
    String? nick,
    List<RefuelingModel>? refuelings,
    List<String>? images,
    List<CalibragemModel>? calibragens,
    List<OilModel>? oils,
    List<OtherMaintenanceModel>? others,
  }) {
    return CarModel(
      id: id ?? this.id,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      image: image ?? this.image,
      nick: nick ?? this.nick,
      refuelings:refuelings ?? this.refuelings,
      images: images ?? this.images,
      calibragens: calibragens ?? this.calibragens,
      oils: oils ?? this.oils,
      others: others ?? this.others,
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
      'calibragens': calibragens?.map((x) => x.toMap()).toList(),
      'oils': oils?.map((x) => x.toMap()).toList(),
      'others': others?.map((x) => x.toMap()).toList(),
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: map['id'],
      model: map['model'],
      brand: map['brand'],
      image: map['image'],
      nick: map['nick'],
      refuelings: List<RefuelingModel>.from(
          map['refuelings']?.map((x) => RefuelingModel.fromMap(x))),
      images: List<String>.from(map['images']),
      calibragens: List<CalibragemModel>.from(
          map['calibragens']?.map((x) => CalibragemModel.fromMap(x))),
      oils: List<OilModel>.from(map['oils']?.map((x) => OilModel.fromMap(x))),
      others: List<OtherMaintenanceModel>.from(
          map['others']?.map((x) => OtherMaintenanceModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) =>
      CarModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarModel(id: $id, model: $model, brand: $brand, image: $image, nick: $nick, refuelings: $refuelings, images: $images, calibragens: $calibragens, oils: $oils, others: $others)';
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
        listEquals(other.images, images) &&
        listEquals(other.calibragens, calibragens) &&
        listEquals(other.oils, oils) &&
        listEquals(other.others, others);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        model.hashCode ^
        brand.hashCode ^
        image.hashCode ^
        nick.hashCode ^
        refuelings.hashCode ^
        images.hashCode ^
        calibragens.hashCode ^
        oils.hashCode ^
        others.hashCode;
  }
}
