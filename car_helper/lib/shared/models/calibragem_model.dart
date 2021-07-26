import 'dart:convert';

class CalibragemModel {
  final String date;
  final double libras;

  CalibragemModel({
    required this.date,
    required this.libras,
  });

  CalibragemModel copyWith({
    String? date,
    double? libras,
  }) {
    return CalibragemModel(
      date: date ?? this.date,
      libras: libras ?? this.libras,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'libras': libras,
    };
  }

  factory CalibragemModel.fromMap(Map<String, dynamic> map) {
    return CalibragemModel(
      date: map['date'],
      libras: map['libras'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CalibragemModel.fromJson(String source) => CalibragemModel.fromMap(json.decode(source));

  @override
  String toString() => 'CalibragemModel(date: $date, libras: $libras)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CalibragemModel &&
      other.date == date &&
      other.libras == libras;
  }

  @override
  int get hashCode => date.hashCode ^ libras.hashCode;
}
