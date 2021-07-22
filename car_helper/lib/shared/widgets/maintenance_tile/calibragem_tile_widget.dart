import 'package:car_helper/shared/models/calibragem_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CalibragemTileWidget extends StatelessWidget {
  final CalibragemModel calibragem;
  const CalibragemTileWidget({Key? key, required this.calibragem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.contrastBackground),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Icon(FontAwesomeIcons.solidCalendarAlt,
                      color: AppColors.secondary, size: 18),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    calibragem.date,
                    style: GoogleFonts.lexendDeca(
                      fontSize: 13,
                      color: Colors.grey[800],
                    ),
                  ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Calibragem de Pneus',
            style: GoogleFonts.lexendDeca(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.tertiary,
            ),
          ),
          SizedBox(
            height: 15,
          ),
           Text(
                '${calibragem.libras} Libras',
                style: GoogleFonts.lexendDeca(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
           SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
