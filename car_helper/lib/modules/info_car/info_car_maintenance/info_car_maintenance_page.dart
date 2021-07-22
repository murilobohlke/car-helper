import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/models/calibragem_model.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/models/oil_model.dart';
import 'package:car_helper/shared/models/other_maintenance_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/maintenance_tile/maintenance_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCarMaintencePage extends StatelessWidget {
  final CarModel car;
  const InfoCarMaintencePage(this.car);

  @override
  Widget build(BuildContext context) {
    OilModel aux = OilModel(
        date: '12/06/2021',
        odometer: '97.897',
        oil: '5W30',
        value: 137.7,
        oilFilter: true,
        airFilter: false,
        gasFilter: false,
        airCFilter: false);

    CalibragemModel aux2 = CalibragemModel(date: '25/07/2021', libras: 34.0);

    OtherMaintenanceModel aux3 = OtherMaintenanceModel(
        date: '25/06/2021',
        odometer: '96.421',
        title: 'Limpeza dos bancos',
        total: 68.39);

    return AnimatedCard(
      direction: AnimatedCardDirection.top,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 4),
        child: Column(
          children: [
            Text('Manutenção',
                style: GoogleFonts.lexendDeca(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                )),
            Container(
              width: 60,
              height: 3,
              color: AppColors.tertiary.withOpacity(0.8),
              margin: EdgeInsets.symmetric(vertical: 5),
            ),
            SizedBox(
              height: 10,
            ),
            MaintenanceTileWidget(
              oil: aux,
            ),
            SizedBox(
              height: 10,
            ),
            MaintenanceTileWidget(
              calibragem: aux2,
            ),
            SizedBox(
              height: 10,
            ),
            MaintenanceTileWidget(
              other: aux3,
            )
          ],
        ),
      ),
    );
  }
}
