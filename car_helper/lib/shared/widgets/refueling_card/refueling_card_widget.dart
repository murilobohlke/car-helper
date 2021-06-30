import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RefuelingCardWidget extends StatelessWidget {
  final CarModel data;
  const RefuelingCardWidget({ Key? key, required this.data }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return  Container(
      width: double.infinity,
      height: height/5,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: AppColors.primary.withOpacity(0.2)
       ),
       padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Combustível',
            style: GoogleFonts.lexendDeca(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.tertiary,
            )
          ),
          Text('Último Abastecimento\n01/06/2021', textAlign: TextAlign.center,),
          Text('Valor\nR\$ 231,80', textAlign: TextAlign.center,),
          Text('Média\n10.5 Km/L', textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}