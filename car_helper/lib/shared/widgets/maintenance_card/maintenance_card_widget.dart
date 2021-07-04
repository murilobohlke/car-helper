import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceCardWidget extends StatelessWidget {
  final CarModel data;
  const MaintenanceCardWidget({ Key? key, required this.data }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return  Container(
      width: double.infinity,
      height: height/5,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: AppColors.contrastBackground
       ),
       padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Manutenção',
            style: GoogleFonts.lexendDeca(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.tertiary,
            )
          ),
          Spacer(),
          Text(
            'Não Disponível', 
            style: GoogleFonts.lexendDeca(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            )
          ),
          Spacer()
        ],
      ),
    );
  }
}