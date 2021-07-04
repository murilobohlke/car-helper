import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/models/car_model.dart';
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
        margin: EdgeInsets.all(20),
        child: Center(
          child: car.refuelings == null 
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
              return RefuelingTileWidget(ref: car.refuelings![index]);
            },
          ),
        ),
      ),
    );
  }
}
