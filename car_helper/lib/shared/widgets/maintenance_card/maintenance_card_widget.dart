import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/maintenance_card/maintenance_controller.dart';
import 'package:car_helper/shared/widgets/show_text/show_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceCardWidget extends StatelessWidget {
  final CarModel data;
  const MaintenanceCardWidget({ Key? key, required this.data }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = MaintenanceController();

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
          padding: EdgeInsets.symmetric(vertical: 20),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    ShowTextWidget( label: 'Próxima Troca de Óleo', text: controller.nextChangeOil(data.oils!), isWhite: true,),
                    SizedBox(height: 10,),
                    ShowTextWidget( label: 'Próxima Calibragem', text: controller.nextCalibragem(data.calibragens!), isWhite: true,)
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}