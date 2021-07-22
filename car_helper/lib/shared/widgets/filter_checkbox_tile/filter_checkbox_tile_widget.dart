import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterCheckboxTileWidget extends StatelessWidget {
  final bool filter;
  final ValueChanged<bool> onChanged;
  final String label;

  const FilterCheckboxTileWidget(
      {Key? key, required this.filter, required this.onChanged, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
          child: CheckboxListTile(
        contentPadding: EdgeInsets.all(0),
        activeColor: AppColors.tertiary,
        tileColor: Colors.red,
        title: Text(
          label,
          style: GoogleFonts.lexendDeca(
            fontSize: 16,
            color: AppColors.primary,
          ),
        ),
        value: filter,
        onChanged: (value) {
          onChanged(value!);
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
