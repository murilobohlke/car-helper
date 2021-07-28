import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/widgets/maintenance_expansion_tile/maintenance_expansion_tile_widget.dart';
import 'package:car_helper/shared/widgets/show_text/show_text_widget.dart';
import 'package:car_helper/shared/widgets/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({Key? key}) : super(key: key);

  @override
  _MaintenancePageState createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  TextEditingController odometerOil = TextEditingController();
  TextEditingController oilOil = TextEditingController();
  TextEditingController valueOil =
      MoneyMaskedTextController(leftSymbol: 'R\$ ', decimalSeparator: '.');

  TextEditingController librasCalibragem = TextEditingController();

  TextEditingController odometerOther = TextEditingController();
  TextEditingController descriptionOther = TextEditingController();
  TextEditingController valueOther =
      MoneyMaskedTextController(leftSymbol: 'R\$ ', decimalSeparator: '.');
  TextEditingController titleOther = TextEditingController();

  DateTime _selectedDate = DateTime.now();

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

  @override
  Widget build(BuildContext context) {
    final CarModel car = ModalRoute.of(context)!.settings.arguments as CarModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Manutenção'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MaintenanceExpansionTileWidget(
                save: (airFilter, airCFilter, oilFilter, gasFilter) {
                  Provider.of<CarsProvider>(context, listen: false).addOil(
                      DateFormat('dd/MM/yyyy').format(_selectedDate),
                      odometerOil.text,
                      oilOil.text,
                      double.parse(valueOil.text.replaceAll('R\$', '')),
                      oilFilter,
                      airFilter,
                      gasFilter,
                      airCFilter,
                      car);
                  Navigator.of(context).pop();
                },
                clean: () {
                  setState(() {
                    _selectedDate = DateTime.now();
                  });
                  odometerOil.text = '';
                  oilOil.text = '';
                  valueOil.text = '0.00';
                },
                isFilters: true,
                title: 'Troca de Óleo e Filtros',
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _showDatePicker,
                      child: ShowTextWidget(
                        isWhite: true,
                        cross: CrossAxisAlignment.start,
                        isLeft: true,
                        label: 'Data',
                        textSize: 16,
                        text: DateFormat('dd/MM/yyyy').format(_selectedDate),
                        icon: FontAwesomeIcons.solidCalendarAlt,
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextInputWidget(
                      keyboard: TextInputType.number,
                      controller: odometerOil,
                      label: 'Odômetro',
                      icon: FontAwesomeIcons.tachometerAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      controller: oilOil,
                      label: 'Óleo',
                      icon: FontAwesomeIcons.filter,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      keyboard: TextInputType.number,
                      controller: valueOil,
                      label: 'Valor',
                      icon: FontAwesomeIcons.moneyBill,
                      whiteColor: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaintenanceExpansionTileWidget(
                save2: () {
                  Provider.of<CarsProvider>(context, listen: false)
                      .addCalibragem(DateFormat('dd/MM/yyyy').format(_selectedDate),
                          double.parse(librasCalibragem.text), car);
                  Navigator.of(context).pop();
                },
                clean: () {
                  setState(() {
                    _selectedDate = DateTime.now();
                  });
                  librasCalibragem.text = '';
                },
                title: 'Calibragem de Pneus',
                child: Column(
                  children: [
                     GestureDetector(
                      onTap: _showDatePicker,
                      child: ShowTextWidget(
                        isWhite: true,
                        cross: CrossAxisAlignment.start,
                        isLeft: true,
                        label: 'Data',
                        textSize: 16,
                        text: DateFormat('dd/MM/yyyy').format(_selectedDate),
                        icon: FontAwesomeIcons.solidCalendarAlt,
                      ),
                    ),
                    TextInputWidget(
                      controller: librasCalibragem,
                      label: 'Libras',
                      keyboard: TextInputType.number,
                      icon: FontAwesomeIcons.sortNumericUp,
                      whiteColor: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaintenanceExpansionTileWidget(
                save2: () {
                  Provider.of<CarsProvider>(context, listen: false).addOther(
                     DateFormat('dd/MM/yyyy').format(_selectedDate),
                      odometerOther.text,
                      titleOther.text,
                      descriptionOther.text,
                      double.parse(valueOther.text.replaceAll('R\$', '')),
                      car);

                  Navigator.of(context).pop();
                },
                clean: () {
                  setState(() {
                    _selectedDate = DateTime.now();
                  });
                  odometerOther.text = '';
                  descriptionOther.text = '';
                  valueOther.text = '0.00';
                },
                title: 'Outra Manutenção',
                child: Column(
                  children: [
                  GestureDetector(
                      onTap: _showDatePicker,
                      child: ShowTextWidget(
                        isWhite: true,
                        cross: CrossAxisAlignment.start,
                        isLeft: true,
                        label: 'Data',
                        textSize: 16,
                        text: DateFormat('dd/MM/yyyy').format(_selectedDate),
                        icon: FontAwesomeIcons.solidCalendarAlt,
                      ),
                    ),
                    TextInputWidget(
                      controller: odometerOther,
                      label: 'Odômetro',
                      icon: FontAwesomeIcons.tachometerAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      controller: titleOther,
                      label: 'Título',
                      icon: FontAwesomeIcons.solidFileAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      controller: descriptionOther,
                      label: 'Descrição',
                      icon: FontAwesomeIcons.solidFileAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      controller: valueOther,
                      label: 'Valor',
                      icon: FontAwesomeIcons.moneyBill,
                      whiteColor: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
