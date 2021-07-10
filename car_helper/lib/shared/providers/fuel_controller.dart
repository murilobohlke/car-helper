import 'package:car_helper/shared/models/refueling_model.dart';

class FuelController {

   String media(List<RefuelingModel> data) {

    if(data.length == 1){
      return '---';
    }
    int i = data.length - 1;

    double num = (double.parse(data[i].odometer) - double.parse(data[i-1].odometer));
    double den = data[i].total / data[i].price;

    return (num/den).toStringAsFixed(2) + ' Km/L';
  }
}