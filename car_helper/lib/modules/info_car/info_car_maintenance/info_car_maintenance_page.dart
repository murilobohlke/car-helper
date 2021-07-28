import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/models/calibragem_model.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/models/oil_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/maintenance_tile/maintenance_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCarMaintencePage extends StatelessWidget {
  final CarModel car;
  const InfoCarMaintencePage(this.car);

  @override
  Widget build(BuildContext context) {

    List<dynamic> all() {
      List<dynamic> aux = [
        ...car.calibragens!,
        ...car.oils!,
        ...car.others!,
      ];

      aux.sort((a, b) {
        var adate = a.date;
        var bdate = b.date;
        return adate.compareTo(bdate);
      });

      return aux.reversed.toList();
    }

    int size() {
      return car.calibragens!.length + car.oils!.length + car.others!.length;
    }

    return AnimatedCard(
      direction: AnimatedCardDirection.top,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 4),
        child: Column(
          children: [
            Text('Manutenções',
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
            Expanded(
              child: size() == 0 
              ? Center(
                child: Text(
                  'Sem Manutenções',
                  style: GoogleFonts.lexendDeca(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    )
                ),
              )
              : ListView.builder(
                  itemCount: size(),
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: all()[i] is CalibragemModel
                          ? MaintenanceTileWidget(
                              calibragem: all()[i],
                              car: car,
                            )
                          : all()[i] is OilModel
                              ? MaintenanceTileWidget(
                                  oil: all()[i],
                                  car: car,
                                )
                              : MaintenanceTileWidget(
                                  other: all()[i],
                                  car: car,
                                ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
