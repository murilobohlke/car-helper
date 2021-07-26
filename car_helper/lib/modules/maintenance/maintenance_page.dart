import 'package:car_helper/shared/widgets/maintenance_expansion_tile/maintenance_expansion_tile_widget.dart';
import 'package:car_helper/shared/widgets/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController dateOil = TextEditingController();
    TextEditingController odometerOil = TextEditingController();
    TextEditingController oilOil = TextEditingController();
    TextEditingController valueOil = TextEditingController();

    TextEditingController dateCalibragem = TextEditingController();
    TextEditingController librasCalibragem = TextEditingController();

    TextEditingController dateOther = TextEditingController();
    TextEditingController odometerOther = TextEditingController();
    TextEditingController descriptionOther = TextEditingController();
    TextEditingController valueOther = TextEditingController();
    TextEditingController titleOther = TextEditingController();

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
                  print(airCFilter);
                  Navigator.of(context).pop();
                },
                clean: () {
                  dateOil.text = '';
                  odometerOil.text = '';
                  oilOil.text = '';
                  valueOil.text = '';
                },
                isFilters: true,
                title: 'Troca de Óleo e Filtros',
                child: Column(
                  children: [
                    TextInputWidget(
                      controller: dateOil,
                      label: 'Data',
                      icon: FontAwesomeIcons.solidCalendarAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
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
                  Navigator.of(context).pop();
                },
                clean: () {
                  dateCalibragem.text = '';
                  librasCalibragem.text = '';
                },
                title: 'Calibragem de Pneus',
                child: Column(
                  children: [
                    TextInputWidget(
                      controller: dateCalibragem,
                      label: 'Data',
                      icon: FontAwesomeIcons.solidCalendarAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      controller: librasCalibragem,
                      label: 'Libras',
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
                  Navigator.of(context).pop();
                },
                clean: () {
                  dateOther.text = '';
                  odometerOther.text = '';
                  descriptionOther.text = '';
                  valueOther.text = '';
                },
                title: 'Outra Manutenção',
                child: Column(
                  children: [
                    TextInputWidget(
                      controller: dateOther,
                      label: 'Data',
                      icon: FontAwesomeIcons.solidCalendarAlt,
                      whiteColor: true,
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
