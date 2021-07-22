class OtherMaintenanceModel {
  final String date;
  final String odometer;
  final String? description;
  final double total;
  final String title;

  OtherMaintenanceModel(
      {required this.date,
      required this.title,
      required this.odometer,
      this.description,
      required this.total});
}
