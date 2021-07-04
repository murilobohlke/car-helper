import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/secondary_button/secondary_button_widget.dart';
import 'package:car_helper/shared/widgets/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class RefuelingPage extends StatefulWidget {
  const RefuelingPage({Key? key}) : super(key: key);

  @override
  _RefuelingPageState createState() => _RefuelingPageState();
}

class _RefuelingPageState extends State<RefuelingPage> {
  
  final dateInputTextController = MaskedTextController(mask: '00/00/0000');
  final hourInputTextController = MaskedTextController(mask: '00:00');
  final moneyInputTextController = MoneyMaskedTextController(leftSymbol: 'R\$', decimalSeparator: '.');
  final totalInputTextController = MoneyMaskedTextController(leftSymbol: 'R\$', decimalSeparator: '.');
  final odometerInputTextController = TextEditingController();
  final gasolineInputTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     final CarModel car = ModalRoute.of(context)!.settings.arguments as CarModel;
    final appBar = AppBar(
        title: Text('Novo Abastecimento'),
      );
    final Size size = MediaQuery.of(context).size;
    final avaliableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height - MediaQuery.of(context).padding.top -70;
    return Scaffold(
      appBar: appBar, 
      body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            width: size.width,
            height: avaliableHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextInputWidget(
                          label: 'Data',
                          keyboard: TextInputType.datetime,
                          controller: dateInputTextController,
                          icon: FontAwesomeIcons.solidCalendarAlt,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                          child: TextInputWidget(
                          label: 'Hora',
                          controller: hourInputTextController,
                          keyboard: TextInputType.datetime,
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
                    controller: odometerInputTextController,
                    keyboard: TextInputType.number,
                    icon: FontAwesomeIcons.tachometerAlt,
                  ),
                ),
                AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  child: TextInputWidget(
                    label: 'Tipo de Combustível',
                    controller: gasolineInputTextController,
                    icon: FontAwesomeIcons.filter,
                  ),
                ),
                AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextInputWidget(
                          label: 'Preço Litro',
                          controller: moneyInputTextController,
                          keyboard: TextInputType.number,
                          icon: FontAwesomeIcons.moneyBill,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextInputWidget(
                          label: 'Total',
                          controller: totalInputTextController,
                          keyboard: TextInputType.number,
                          icon: FontAwesomeIcons.wallet,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80,),
                AnimatedCard(
                  direction: AnimatedCardDirection.right,
                  child: Row(
                    children: [
                      Expanded(child: SecondaryButtonWidget(label: 'Cancelar', onPressed: (){Navigator.of(context).pop();},)),
                      SizedBox(width: 20,),
                      Expanded(child: PrimaryButtonWidget(
                        label: 'Salvar',  
                        onPressed: (){
                          Provider.of<CarsProvider>(context, listen: false).addRefueling(
                            dateInputTextController.text, hourInputTextController.text, odometerInputTextController.text, gasolineInputTextController.text, double.parse(moneyInputTextController.text.replaceAll('R\$', '')), double.parse(totalInputTextController.text.replaceAll('R\$', '')), car);
                          
                          Navigator.of(context).pop();
                        },
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
