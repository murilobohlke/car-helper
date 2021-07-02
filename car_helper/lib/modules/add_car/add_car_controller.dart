
import 'package:car_helper/shared/models/car_model.dart';
import 'package:flutter/cupertino.dart';


class AddCarController {
  final formKey = GlobalKey<FormState>();

  CarModel carModel = CarModel();

  String? validateModel(String? value) =>
      value?.isEmpty ?? true ? "O modelo não pode ser vazio" : null;
  String? validateBrand(String? value) =>
      value?.isEmpty ?? true ? "A marca não pode ser vazia" : null;

  void onChange({String? brand, String? image, String? model, String? nick}) {
    carModel = carModel.copyWith(
        brand: brand, image: image, model: model, nick: nick);
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
