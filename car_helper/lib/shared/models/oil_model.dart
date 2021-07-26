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
     this.date,
     this.odometer,
     this.oil,
     this.value,
     this.oilFilter,
     this.airFilter,
     this.gasFilter,
     this.airCFilter);

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
      date ?? this.date,
      odometer ?? this.odometer,
      oil ?? this.oil,
      value ?? this.value,
      oilFilter ?? this.oilFilter,
      airFilter ?? this.airFilter,
      gasFilter ?? this.gasFilter,
      airCFilter ?? this.airCFilter,
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
      map['date'],
      map['odometer'],
      map['oil'],
      map['value'],
      map['oilFilter'],
      map['airFilter'],
      map['gasFilter'],
      map['airCFilter'],
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
