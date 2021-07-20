import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowTextWidget extends StatelessWidget {
  final String label;
  final String text;
   final IconData icon;

  const ShowTextWidget({Key? key, required this.icon, required this.label, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Icon(
              icon,
              color: AppColors.secondary,
            ),
          ),
          Spacer(),
          Column(
            children: [
              Text(
                label,
                style: GoogleFonts.lexendDeca(
                  fontSize: 12,
                  color: AppColors.tertiary,
                ),
              ),
              Text(
                text,
                style: GoogleFonts.lexendDeca(
                  fontSize: 18,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
