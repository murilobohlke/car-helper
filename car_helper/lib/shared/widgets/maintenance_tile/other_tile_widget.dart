import 'package:car_helper/shared/models/other_maintenance_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherTileWidget extends StatelessWidget {
  final OtherMaintenanceModel other;

  const OtherTileWidget({Key? key, required this.other}) : super(key: key);

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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.solidCalendarAlt,
                          color: AppColors.secondary, size: 18),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        other.date,
                        style: GoogleFonts.lexendDeca(
                          fontSize: 13,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.tachometerAlt,
                      color: AppColors.secondary, size: 18),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    other.odometer,
                    style: GoogleFonts.lexendDeca(
                      fontSize: 13,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            other.title,
            style: GoogleFonts.lexendDeca(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.tertiary,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          if(other.description != null)
          Text(
                other.description!,
                style: GoogleFonts.lexendDeca(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
          if(other.description != null)
          SizedBox(
            height: 10,
          ),
          Text(
                'Total R\$ ${other.total.toStringAsFixed(2)}',
                style: GoogleFonts.lexendDeca(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
