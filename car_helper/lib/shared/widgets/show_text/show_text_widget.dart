import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowTextWidget extends StatelessWidget {
  final String label;
  final String text;
  final IconData? icon;
  final bool isWhite;
  final double textSize;
  final bool isLeft;
  final CrossAxisAlignment cross;

  const ShowTextWidget(
      {Key? key,
      this.textSize = 18,
      this.isWhite = false,
      this.icon,
      this.cross = CrossAxisAlignment.center,
      this.isLeft = false,
      required this.label,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isWhite ? Colors.white : Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                icon,
                color: AppColors.secondary,
              ),
            ),
          isLeft
              ? SizedBox(
                  width: 15,
                )
              : Spacer(),
          Column(
            crossAxisAlignment: cross,
            children: [
              Text(
                label,
                style: GoogleFonts.lexendDeca(
                  fontSize: 12,
                  color: AppColors.tertiary,
                ),
              ),
              isLeft
                  ? SizedBox(
                      height: 9,
                    )
                  : SizedBox(
                      height: 0,
                    ),
              Text(
                text,
                style: GoogleFonts.lexendDeca(
                  fontSize: textSize,
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
