import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/providers/fuel_controller.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/show_text/show_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RefuelingCardWidget extends StatelessWidget {
  final CarModel data;
  const RefuelingCardWidget({ Key? key, required this.data }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = FuelController();
    
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 6,
        child: Container(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ShowTextWidget(textSize: 15, label: 'Média', text: '${controller.mediaKmL(data.refuelings!)}', isWhite: true,),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: ShowTextWidget(textSize: 15, label: 'Distância', text: '${controller.distance(data.refuelings!)}', isWhite: true,),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: ShowTextWidget(textSize: 15, label: 'Média', text: '${controller.mediaRsKm(data.refuelings!)}', isWhite: true,),
                  )
                  ],
              ),
            ),
            SizedBox(height: 5,),
             Text(
              'Geral',
              style: GoogleFonts.lexendDeca(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ShowTextWidget(textSize: 15, label: 'Total', text: '${controller.total1(data.refuelings!)}', isWhite: true,),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: ShowTextWidget(textSize: 15, label: 'Total', text: '${controller.total2(data.refuelings!)}', isWhite: true,),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: ShowTextWidget(textSize: 15, label: 'Total', text: '${controller.total3(data.refuelings!)}', isWhite: true,),
                  )
                  ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}