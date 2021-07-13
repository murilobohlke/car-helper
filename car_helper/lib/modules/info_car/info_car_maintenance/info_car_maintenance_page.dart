import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCarMaintencePage extends StatelessWidget {
  final CarModel car;
  const InfoCarMaintencePage(this.car);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.top,
          child: Center(
        child: Text(
          'Manutenção',
          style: GoogleFonts.lexendDeca(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            )
        ),
      ),
    );
  }
}
