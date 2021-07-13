import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/refueling_tile/refueling_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCarRefuelingPage extends StatelessWidget {
  final CarModel car;
  const InfoCarRefuelingPage({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.top,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 4),
        child: Column(
          children: [
            Text(
              'Reabastecimentos',
              style: GoogleFonts.lexendDeca(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              )
            ),
            Container(
              width: 60,
              height: 3,
              color: AppColors.tertiary.withOpacity(0.8),
              margin: EdgeInsets.symmetric(vertical: 5),
            ),
            Expanded(
              child: Center(
                child: car.refuelings!.length == 0 
                ? Text(
                  'Sem Reabastecimentos',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  )
                )
                : ListView.builder(
                  itemCount: car.refuelings!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: RefuelingTileWidget(id: car.id!, ref: car.refuelings![index]));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
