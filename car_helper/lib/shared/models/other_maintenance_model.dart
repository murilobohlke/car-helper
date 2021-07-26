import 'dart:convert';

class OtherMaintenanceModel {
  final String date;
  final String odometer;
  final String? description;
  final double total;
  final String title;

  OtherMaintenanceModel(
    this.date,
    this.odometer,
    this.description,
    this.total,
    this.title );

  OtherMaintenanceModel copyWith({
    String? date,
    String? odometer,
    String? description,
    double? total,
    String? title,
  }) {
    return OtherMaintenanceModel(
      date ?? this.date,
      odometer ?? this.odometer,
      description ?? this.description,
      total ?? this.total,
      title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'odometer': odometer,
      'description': description,
      'total': total,
      'title': title,
    };
  }

  factory OtherMaintenanceModel.fromMap(Map<String, dynamic> map) {
    return OtherMaintenanceModel(
      map['date'],
      map['odometer'],
      map['description'],
      map['total'],
      map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherMaintenanceModel.fromJson(String source) => OtherMaintenanceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OtherMaintenanceModel(date: $date, odometer: $odometer, description: $description, total: $total, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OtherMaintenanceModel &&
      other.date == date &&
      other.odometer == odometer &&
      other.description == description &&
      other.total == total &&
      other.title == title;
  }

  @override
  int get hashCode {
    return date.hashCode ^
      odometer.hashCode ^
      description.hashCode ^
      total.hashCode ^
      title.hashCode;
  }
}
