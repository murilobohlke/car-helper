import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/widgets/grid_buttons/grid_buttons_widget.dart';
import 'package:car_helper/shared/widgets/maintenance_card/maintenance_card_widget.dart';
import 'package:car_helper/shared/widgets/refueling_card/refueling_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoCarHomePage extends StatelessWidget {
  final CarModel car;
  const InfoCarHomePage({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.bottom,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: 5,
                // ),
                // Text('Informações sobre ${car.nick == '' ? 'carro' : car.nick}',
                //     style: GoogleFonts.lexendDeca(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.grey[800],
                //     )),
                // Container(
                //   width: 60,
                //   height: 3,
                //   color: AppColors.tertiary.withOpacity(0.8),
                //   margin: EdgeInsets.symmetric(vertical: 5),
                // ),
                SizedBox(height: 5),
                Consumer<CarsProvider>(
                    builder: (context, value, child) =>
                        RefuelingCardWidget(data: value.itemById(car.id!))),
                SizedBox(
                  height: 10,
                ),
                Consumer<CarsProvider>(builder: (context, value, child) {
                  return MaintenanceCardWidget(data: value.itemById(car.id!));
                }),
                SizedBox(
                  height: 20,
                ),
                GridButtonsWidget(car: car)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
