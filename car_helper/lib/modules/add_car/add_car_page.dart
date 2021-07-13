import 'dart:io';

import 'package:animated_card/animated_card.dart';
import 'package:car_helper/modules/add_car/add_car_controller.dart';
import 'package:car_helper/shared/models/car_model.dart';
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
  TextEditingController? modelController;
  TextEditingController? brandController;
  TextEditingController? nickController;

  void _selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  @override
  void initState() {
    modelController = TextEditingController();
    brandController = TextEditingController();
    nickController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CarModel? car = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments as CarModel
        : null;

    File? img;
    if (car != null) {
      modelController!.text = car.model!;
      brandController!.text = car.brand!;
      nickController!.text = car.nick == null ? '' : car.nick!;
      img = File(car.image!);
    }

    return Scaffold(
      appBar: AppBar(
        title: car == null ? Text('Adicionar Carro') : Text('Editar Carro'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  ImageInputWidget(
                      onSelectImage: _selectImage, img: img),
                  SizedBox(
                    height: 30,
                  ),
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
                      )),
                  AnimatedCard(
                      direction: AnimatedCardDirection.left,
                      child: TextInputWidget(
                        validator: controller.validateModel,
                        label: 'Modelo',
                        controller: modelController,
                        icon: FontAwesomeIcons.solidStar,
                        onChanged: (value) {
                          controller.onChange(model: value);
                        },
                      )),
                  AnimatedCard(
                      direction: AnimatedCardDirection.left,
                      child: TextInputWidget(
                        label: 'Apelido',
                        controller: nickController,
                        icon: FontAwesomeIcons.burn,
                        onChanged: (value) {
                          controller.onChange(nick: value);
                        },
                      )),
                  SizedBox(
                    height: 30,
                  ),
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
                        )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: PrimaryButtonWidget(
                                label: 'Salvar',
                                onPressed: _pickedImage == null && car == null ? null : () async {
                                  var resp = await controller.formValid();
                                  if (resp) {
                                    if(car == null){
                                      Provider.of<CarsProvider>(context,listen: false)
                                        .addCar(
                                            brandController!.text,
                                            modelController!.text,
                                            _pickedImage!.path,
                                            nickController!.text);
                                    } else{
                                      Provider.of<CarsProvider>(context,listen: false)
                                        .updateCar(
                                            brandController!.text,
                                            modelController!.text,
                                            _pickedImage == null ? car.image! :_pickedImage!.path,
                                            nickController!.text,
                                            car.id!);
                                    }
                                    Navigator.pop(context, 
                                    CarModel(
                                      brand: brandController!.text,
                                      model:  modelController!.text,
                                      nick: nickController!.text,
                                      id: car?.id!,
                                      refuelings: car?.refuelings!,
                                      images: car?.images!,
                                      image: _pickedImage == null ? car?.image! :_pickedImage!.path,
                                    ));
                                  }
                                })),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
