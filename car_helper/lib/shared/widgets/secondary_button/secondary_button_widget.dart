import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const SecondaryButtonWidget(
      {Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 2.0, color: AppColors.secondary,),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15),
          ),
          primary: Colors.white,
          onPrimary: AppColors.secondary,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          textStyle: GoogleFonts.montserrat(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
