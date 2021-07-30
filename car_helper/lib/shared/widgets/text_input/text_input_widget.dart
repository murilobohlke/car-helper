import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInputWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final TextInputType? keyboard;
  final bool obscure;
  final TextCapitalization textCapt;
  final bool whiteColor;
  final TextInputAction textAction;

  const TextInputWidget({
    Key? key,
    this.textCapt = TextCapitalization.sentences,
    required this.label,
    required this.icon,
    this.initialValue,
    this.obscure = false,
    this.validator,
    this.controller,
    this.onChanged,
    this.textAction = TextInputAction.done,
    this.whiteColor = false,
    this.keyboard = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: whiteColor ? Colors.white : Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
            textInputAction: textAction,
            textCapitalization: textCapt,
            obscureText: obscure,
            key: key,
            onChanged: onChanged,
            keyboardType: keyboard,
            controller: controller,
            validator: validator,
            initialValue: initialValue,
            style: GoogleFonts.lexendDeca(
              fontSize: 16,
              color: AppColors.primary,
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: label,
                labelStyle: GoogleFonts.lexendDeca(
                  fontSize: 16,
                  color: AppColors.tertiary,
                ),
                icon: Icon(
                  icon,
                  color: AppColors.secondary,
                ),
                border: InputBorder.none)),
      ),
    );
  }
}
