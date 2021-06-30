import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const GridButtonWidget({Key? key, required this.label, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15),
          ),
          primary: AppColors.tertiary,
          //padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: GoogleFonts.montserrat(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          )),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            size: 30,
          ),
          SizedBox(
            height: 5,
          ),
          Text(label),
        ],
      ),
    );
  }
}
