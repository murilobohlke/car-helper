import 'dart:convert';

class RefuelingModel {
  String date;
  String hour;
  String odometer;
  String type;
  double price;
  double total;
  
  RefuelingModel({
    required this.date,
    required this.hour,
    required this.odometer,
    required this.type,
    required this.price,
    required this.total,
  });
  

  RefuelingModel copyWith({
    String? date,
    String? hour,
    String? odometer,
    String? type,
    double? price,
    double? total,
  }) {
    return RefuelingModel(
      date: date ?? this.date,
      hour: hour ?? this.hour,
      odometer: odometer ?? this.odometer,
      type: type ?? this.type,
      price: price ?? this.price,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'hour': hour,
      'odometer': odometer,
      'type': type,
      'price': price,
      'total': total,
    };
  }

  factory RefuelingModel.fromMap(Map<String, dynamic> map) {
    return RefuelingModel(
      date: map['date'],
      hour: map['hour'],
      odometer: map['odometer'],
      type: map['type'],
      price: map['price'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RefuelingModel.fromJson(String source) => RefuelingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RefuelingModel(date: $date, hour: $hour, odometer: $odometer, type: $type, price: $price, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RefuelingModel &&
      other.date == date &&
      other.hour == hour &&
      other.odometer == odometer &&
      other.type == type &&
      other.price == price &&
      other.total == total;
  }

  @override
  int get hashCode {
    return date.hashCode ^
      hour.hashCode ^
      odometer.hashCode ^
      type.hashCode ^
      price.hashCode ^
      total.hashCode;
  }
}
