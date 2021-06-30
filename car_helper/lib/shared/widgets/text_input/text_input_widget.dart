import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;

  const TextInputWidget({ 
    Key? key, 
    required this.label, 
    required this.icon, 
    this.initialValue, 
    this.validator, 
    this.controller, 
    this.onChanged }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey[300],
           borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          style: TextStyle(color: AppColors.primary),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: label,
              labelStyle: TextStyle(color: AppColors.tertiary),
              icon: Icon(
                icon,
                color: AppColors.secondary,
              ),         
              border: InputBorder.none
            )
          
        ),
      ),
    );
  }
}