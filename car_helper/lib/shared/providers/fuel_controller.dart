import 'package:car_helper/shared/models/refueling_model.dart';

class FuelController {
  String mediaKmL(List<RefuelingModel> data) {
    if (data.length == 1 || data.length == 0) {
      return '---';
    }
    int i = data.length - 1;

    double num =
        (double.parse(data[i].odometer) - double.parse(data[i - 1].odometer));
    double den = data[i].total / data[i].price;

    return (num / den).toStringAsFixed(2) + ' Km/L';
  }

  String distance(List<RefuelingModel> data) {
    if (data.length == 1 || data.length == 0) {
      return '---';
    }
    int i = data.length - 1;

    double num =
        (double.parse(data[i].odometer) - double.parse(data[i - 1].odometer));

    return (num).toStringAsFixed(2) + ' Km';
  }

  String mediaRsKm(List<RefuelingModel> data) {
    if (data.length == 1 || data.length == 0) {
      return '---';
    }
    int i = data.length - 1;

    double num =
        (double.parse(data[i].odometer) - double.parse(data[i - 1].odometer));

    return (data[i].total / num).toStringAsFixed(2) + ' R\$/Km';
  }

  String total1(List<RefuelingModel> data) {
    if (data.length == 0) {
      return '---';
    }

    double total = 0.0;

    data.forEach((item) {
      total += item.total;
    });

    return total.toStringAsFixed(2) + ' R\$';
  }

  String total2(List<RefuelingModel> data) {
    if (data.length == 0) {
      return '---';
    }

    double total = 0.0;

    data.forEach((item) {
      total += item.total / item.price;
    });

    return total.toStringAsFixed(2) + ' L';
  }

  String total3(List<RefuelingModel> data) {
    if (data.length == 0) {
      return '---';
    }

    double total = 0.0;
    total = double.parse(data[data.length-1].odometer) - double.parse(data[0].odometer);

    return total.toStringAsFixed(2) + ' Km';
  }
}
