import 'dart:io';

import 'package:animated_card/animated_card.dart';
import 'package:car_helper/modules/add_car/add_car_controller.dart';
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/widgets/image_input/image_input_widget.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/secondary_button/secondary_button_widget.dart';
import 'package:car_helper/shared/widgets/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({Key? key}) : super(key: key);

  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  File? _pickedImage;
  final controller = AddCarController();

  void _selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelController = TextEditingController();
    final brandController = TextEditingController();
    final nickController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Carro'),
      ),
      body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.fromLTRB(30,50,30,50),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                ImageInputWidget(this._selectImage),
                SizedBox(height: 30,),
                AnimatedCard(
                    direction: AnimatedCardDirection.left,
                    child: TextInputWidget(
                      validator: controller.validateBrand,
                      label: 'Marca', 
                      controller: brandController,
                      icon: FontAwesomeIcons.car,
                      onChanged: (value) {
                        controller.onChange(brand: value);
                      },
                    )
                ),
                AnimatedCard(
                    direction: AnimatedCardDirection.left,
                    child: TextInputWidget(
                        validator: controller.validateModel,
                        label: 'Modelo', 
                        controller: modelController,
                        icon: FontAwesomeIcons.info,
                        onChanged: (value) {
                        controller.onChange(model: value);
                        },
                    )
                ),
                AnimatedCard(
                    direction: AnimatedCardDirection.left,
                    child: TextInputWidget(
                        label: 'Apelido', 
                        controller: nickController,
                        icon: FontAwesomeIcons.burn,
                        onChanged: (value) {
                        controller.onChange(nick: value);
                        },
                    )
                ),
                SizedBox(height: 30,),
                AnimatedCard(
                  direction: AnimatedCardDirection.right,
                  child: Row(
                    children: [
                      Expanded(
                          child: SecondaryButtonWidget(
                              label: 'Cancelar',
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                          )
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: PrimaryButtonWidget(
                              label: 'Salvar',
                              onPressed: () async{
                                  var resp = await controller.formValid();
                                  if(resp){
                                    Provider.of<CarsProvider>(context, listen: false).addCar(
                                     brandController.text, 
                                      modelController.text, 
                                      _pickedImage!.path,
                                      nickController.text
                                    );

                                  Navigator.of(context).pop();
                                  }
                              }
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
