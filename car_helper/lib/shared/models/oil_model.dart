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
    {required this.date, 
    required this.odometer, 
    required this.oil, 
    required this.value, 
    required this.oilFilter, 
    required this.airFilter, 
    required this.gasFilter, 
    required this.airCFilter}
  );

}
