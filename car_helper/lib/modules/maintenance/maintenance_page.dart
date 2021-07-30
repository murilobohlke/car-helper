import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/widgets/maintenance_expansion_tile/calibragem_expansion_tile_widget.dart';
import 'package:car_helper/shared/widgets/maintenance_expansion_tile/oil_expansion_tile_widget.dart';
import 'package:car_helper/shared/widgets/maintenance_expansion_tile/other_expansion_tile_widget.dart';
import 'package:flutter/material.dart';

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({Key? key}) : super(key: key);

  @override
  _MaintenancePageState createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {

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
              OilExpansionTileWidget(car: car,),
              SizedBox(height: 10,),
              CalibragemExpansionTileWidget(car: car),
              SizedBox(height: 10,),
              OtherExpansionTileWidget(car: car),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
