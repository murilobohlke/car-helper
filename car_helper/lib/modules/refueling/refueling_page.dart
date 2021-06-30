import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/secondary_button/secondary_button_widget.dart';
import 'package:car_helper/shared/widgets/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RefuelingPage extends StatefulWidget {
  const RefuelingPage({Key? key}) : super(key: key);

  @override
  _RefuelingPageState createState() => _RefuelingPageState();
}

class _RefuelingPageState extends State<RefuelingPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Abastecimento'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,20,30,0),
        child: Container(
          width: size.width,
          child: Column(
            children: [
              AnimatedCard(
                direction: AnimatedCardDirection.left,
                child: Row(
                  children: [
                    Expanded(
                        child: TextInputWidget(
                        label: 'Data',
                        icon: FontAwesomeIcons.solidCalendarAlt,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                        child: TextInputWidget(
                        label: 'Hora',
                        icon: FontAwesomeIcons.solidClock,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.left,
                child: TextInputWidget(
                  label: 'Odômetro',
                  icon: FontAwesomeIcons.tachometerAlt,
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.left,
                child: TextInputWidget(
                  label: 'Tipo de Combustível',
                  icon: FontAwesomeIcons.filter,
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.left,
                child: Row(
                  children: [
                    Expanded(
                      child: TextInputWidget(
                        label: 'Preço',
                        icon: FontAwesomeIcons.moneyBillAlt,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextInputWidget(
                        label: 'Total',
                        icon: FontAwesomeIcons.wallet,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
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
