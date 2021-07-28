import 'package:car_helper/shared/models/calibragem_model.dart';
import 'package:car_helper/shared/models/oil_model.dart';
import 'package:intl/intl.dart';

class MaintenanceController {
  String nextChangeOil(List<OilModel> data) {
    if (data.length == 0) {
      return '';
    }

    int i = data.length - 1;

    var aux = data[i].date;

    var newDate = new DateTime(int.parse(aux.split('/')[2]),
        int.parse(aux.split('/')[1]), int.parse(aux.split('/')[0]) + 15);

    return '${DateFormat('dd/MM/yyyy').format(newDate)} ou ${int.parse(data[i].odometer) + 10000} Km';
  }

  String nextCalibragem(List<CalibragemModel> data) {
    if (data.length == 0) {
      return '';
    }
    int i = data.length - 1;
    var aux = data[i].date;

    var newDate = new DateTime(int.parse(aux.split('/')[2]),
        int.parse(aux.split('/')[1]), int.parse(aux.split('/')[0]) + 15);

    return DateFormat('dd/MM/yyyy').format(newDate);
  }
}
