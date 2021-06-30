import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/secondary_button/secondary_button_widget.dart';
import 'package:car_helper/shared/widgets/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({ Key? key }) : super(key: key);

  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Carro'),),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,20,30,0),
        child: Column(
          children: [
            AnimatedCard(
              direction: AnimatedCardDirection.left,
              child: Container(
                width: double.infinity, 
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            AnimatedCard(direction: AnimatedCardDirection.left, child: TextInputWidget(label:'Marca', icon: FontAwesomeIcons.car)),
            AnimatedCard(direction: AnimatedCardDirection.left, child: TextInputWidget(label:'Modelo', icon: FontAwesomeIcons.info)),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: SecondaryButtonWidget(label: 'Cancelar', onPressed: (){Navigator.of(context).pop();},)),
            SizedBox(width: 20,),
            Expanded(child: PrimaryButtonWidget(label: 'Salvar',  onPressed: (){},) ),
          ],
        ),
      ),
    );
  }
}