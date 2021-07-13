import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/providers/fuel_controller.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RefuelingCardWidget extends StatelessWidget {
  final CarModel data;
  const RefuelingCardWidget({ Key? key, required this.data }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = FuelController();
    
    return  Container(
      width: double.infinity,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: AppColors.contrastBackground
       ),
       padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            'Combustível',
            style: GoogleFonts.lexendDeca(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.tertiary,
            )
          ),
          SizedBox(height: 15,),
          Text(
            'Último Abastecimento',
            style: GoogleFonts.lexendDeca(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                )
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Média\n ${controller.mediaKmL(data.refuelings!)}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexendDeca(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    )
                  ),
                  SizedBox(height: 10,),
                  Text(
                    ' ',
                    style: GoogleFonts.lexendDeca(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    )
                  ),
                  SizedBox(height: 5,),
                   Text(
                    'Total\n ${controller.total1(data.refuelings!)}', 
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexendDeca(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    )
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Distância\n ${controller.distance(data.refuelings!)}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexendDeca(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    )
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Geral',
                    style: GoogleFonts.lexendDeca(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    )
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Total\n ${controller.total2(data.refuelings!)}', 
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexendDeca(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    )
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Média\n ${controller.mediaRsKm(data.refuelings!)}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexendDeca(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    )
                  ),
                  SizedBox(height: 10,),
                  Text(
                    ' ',
                    style: GoogleFonts.lexendDeca(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    )
                  ),
                  SizedBox(height: 5,),
                   Text(
                    'Total\n ${controller.total3(data.refuelings!)}', 
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexendDeca(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    )
                  ),
                ],
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}