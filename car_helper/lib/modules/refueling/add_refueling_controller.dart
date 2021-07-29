
import 'package:car_helper/shared/models/refueling_model.dart';
import 'package:flutter/cupertino.dart';


class AddRefuelingController {
  final formKey = GlobalKey<FormState>();

  RefuelingModel? refueling;

  String? validateOdometer(String? value) =>
      value?.isEmpty ?? true ? "O odômetro não pode ser vazio" : null;

  void onChange({String? date, String? hour, String? odometer, String? type, double? price, double? total}) {
    refueling = refueling!.copyWith(
        date: 'date',
        hour: 'hour',
        odometer: odometer,
        price: 1,
        total: 2,
        type: 'type');
  }

  Future<bool> formValid() async {
    final form = formKey.currentState;
    
    if (form!.validate()) {
      //await saveBoleto();
      return true;
    }
    
    return false;
  }

}
