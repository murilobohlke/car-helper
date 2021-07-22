
import 'package:car_helper/shared/widgets/maintenance_expansion_tile/maintenance_expansion_tile_widget.dart';
import 'package:car_helper/shared/widgets/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova Manutenção'),),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MaintenanceExpansionTileWidget(
                title: 'Troca de Óleo e Filtros',
                child: Column(
                  children: [
                    TextInputWidget(
                      label: 'Data',
                      icon: FontAwesomeIcons.solidCalendarAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      label: 'Odômetro',
                      icon: FontAwesomeIcons.tachometerAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      label: 'Óleo',
                      icon: FontAwesomeIcons.filter,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      label: 'Valor',
                      icon: FontAwesomeIcons.moneyBill,
                      whiteColor: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              MaintenanceExpansionTileWidget(
                title: 'Calibragem de Pneus',
                child: Column(
                  children: [
                    TextInputWidget(
                      label: 'Data',
                      icon: FontAwesomeIcons.solidCalendarAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      label: 'Libras',
                      icon: FontAwesomeIcons.sortNumericUp,
                      whiteColor: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              MaintenanceExpansionTileWidget(
                title: 'Outra Manutenção',
                child: Column(
                  children: [
                    TextInputWidget(
                      label: 'Data',
                      icon: FontAwesomeIcons.solidCalendarAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      label: 'Odômetro',
                      icon: FontAwesomeIcons.tachometerAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      label: 'Descrição',
                      icon: FontAwesomeIcons.solidFileAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      label: 'Valor',
                      icon: FontAwesomeIcons.moneyBill,
                      whiteColor: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
        
      ),
    );
  }
}