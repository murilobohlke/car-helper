import 'dart:convert';

class OilModel {
  final String date;
  final String odometer;
  final String oil;
  final double value;
  final bool oilFilter;
  final bool airFilter;
  final bool gasFilter;
  final bool airCFilter;

  OilModel(
      {
      required this.date,
      required this.odometer,
      required this.oil,
      required this.value,
      required this.oilFilter,
      required this.airFilter,
      required this.gasFilter,
      required this.airCFilter});

  OilModel copyWith({
    String? date,
    String? odometer,
    String? oil,
    double? value,
    bool? oilFilter,
    bool? airFilter,
    bool? gasFilter,
    bool? airCFilter,
  }) {
    return OilModel(
      date: date ?? this.date,
      odometer: odometer ?? this.odometer,
      oil: oil ?? this.oil,
      value: value ?? this.value,
      oilFilter: oilFilter ?? this.oilFilter,
      airFilter: airFilter ?? this.airFilter,
      gasFilter: gasFilter ?? this.gasFilter,
      airCFilter: airCFilter ?? this.airCFilter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'odometer': odometer,
      'oil': oil,
      'value': value,
      'oilFilter': oilFilter,
      'airFilter': airFilter,
      'gasFilter': gasFilter,
      'airCFilter': airCFilter,
    };
  }

  factory OilModel.fromMap(Map<String, dynamic> map) {
    return OilModel(
      date: map['date'],
      odometer: map['odometer'],
      oil: map['oil'],
      value: map['value'],
      oilFilter: map['oilFilter'],
      airFilter: map['airFilter'],
      gasFilter:map['gasFilter'],
      airCFilter: map['airCFilter'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OilModel.fromJson(String source) =>
      OilModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OilModel(date: $date, odometer: $odometer, oil: $oil, value: $value, oilFilter: $oilFilter, airFilter: $airFilter, gasFilter: $gasFilter, airCFilter: $airCFilter)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OilModel &&
        other.date == date &&
        other.odometer == odometer &&
        other.oil == oil &&
        other.value == value &&
        other.oilFilter == oilFilter &&
        other.airFilter == airFilter &&
        other.gasFilter == gasFilter &&
        other.airCFilter == airCFilter;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        odometer.hashCode ^
        oil.hashCode ^
        value.hashCode ^
        oilFilter.hashCode ^
        airFilter.hashCode ^
        gasFilter.hashCode ^
        airCFilter.hashCode;
  }
}
