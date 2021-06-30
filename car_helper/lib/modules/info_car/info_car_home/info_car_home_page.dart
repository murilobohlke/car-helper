import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/widgets/grid_buttons/grid_buttons_widget.dart';
import 'package:car_helper/shared/widgets/refueling_card/refueling_card_widget.dart';
import 'package:flutter/material.dart';

class InfoCarHomePage extends StatelessWidget {
  final CarModel car;
  const InfoCarHomePage({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          RefuelingCardWidget(
            data: car,
          ),
          SizedBox(
            height: 20,
          ),
          GridButtonsWidget()
        ],
      ),
    );
  }
}
