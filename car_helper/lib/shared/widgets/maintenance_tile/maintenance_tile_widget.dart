import 'package:car_helper/shared/models/calibragem_model.dart';
import 'package:car_helper/shared/models/oil_model.dart';
import 'package:car_helper/shared/models/other_maintenance_model.dart';
import 'package:car_helper/shared/widgets/maintenance_tile/calibragem_tile_widget.dart';
import 'package:car_helper/shared/widgets/maintenance_tile/oil_tile_widget.dart';
import 'package:car_helper/shared/widgets/maintenance_tile/other_tile_widget.dart';
import 'package:flutter/material.dart';


class MaintenanceTileWidget extends StatelessWidget {
  final OilModel? oil;
  final CalibragemModel? calibragem;
  final OtherMaintenanceModel? other;

  const MaintenanceTileWidget({Key? key, this.oil, this.calibragem, this.other}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 6,
      child: oil != null 
      ? OilTileWidget(oil: oil!) 
      : calibragem != null 
        ? CalibragemTileWidget(calibragem: calibragem!,) 
        : OtherTileWidget(other: other!)
    );
  }
}
