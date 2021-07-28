import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/secondary_button/secondary_button_widget.dart';
import 'package:car_helper/shared/widgets/show_text/show_text_widget.dart';
import 'package:car_helper/shared/widgets/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RefuelingPage extends StatefulWidget {
  const RefuelingPage({Key? key}) : super(key: key);

  @override
  _RefuelingPageState createState() => _RefuelingPageState();
}

class _RefuelingPageState extends State<RefuelingPage> {
  // final dateInputTextController = MaskedTextController(mask: '00/00/0000');
  // final hourInputTextController = MaskedTextController(mask: '00:00');
  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: 'R\$ ', decimalSeparator: '.');
  final totalInputTextController =
      MoneyMaskedTextController(leftSymbol: 'R\$ ', decimalSeparator: '.');
  final odometerInputTextController = TextEditingController();
  final gasolineInputTextController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  _showTimePicker() {
    showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now(),
      )
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedTime = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final CarModel car = ModalRoute.of(context)!.settings.arguments as CarModel;
    final appBar = AppBar(
      title: Text('Novo Abastecimento'),
    );
    final Size size = MediaQuery.of(context).size;
    final avaliableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        70;
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
                        child: GestureDetector(
                          onTap: _showDatePicker,
                          child: ShowTextWidget(
                            cross: CrossAxisAlignment.start,
                            isLeft: true,
                            label: 'Data',
                            textSize: 16,
                            text:
                                DateFormat('dd/MM/yyyy').format(_selectedDate),
                            icon: FontAwesomeIcons.solidCalendarAlt,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: _showTimePicker,
                          child: ShowTextWidget(
                            cross: CrossAxisAlignment.start,
                            isLeft: true,
                            label: 'Hora',
                            textSize: 16,
                            text: '${_selectedTime.hour}:${_selectedTime.minute}',
                            icon: FontAwesomeIcons.solidClock,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
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
                      SizedBox(
                        width: 10,
                      ),
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
                SizedBox(
                  height: 80,
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
                        onPressed: () {
                          Provider.of<CarsProvider>(context, listen: false)
                              .addRefueling(
                                  DateFormat('dd/MM/yyyy').format(_selectedDate),
                                  '${_selectedTime.hour}:${_selectedTime.minute}',
                                  odometerInputTextController.text,
                                  gasolineInputTextController.text,
                                  double.parse(moneyInputTextController.text
                                      .replaceAll('R\$', '')),
                                  double.parse(totalInputTextController.text
                                      .replaceAll('R\$', '')),
                                  car);

                          Navigator.of(context).pop();
                        },
                      )),
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
