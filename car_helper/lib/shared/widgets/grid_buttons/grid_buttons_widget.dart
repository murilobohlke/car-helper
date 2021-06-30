import 'package:car_helper/shared/widgets/grid_button/grid_button_widget.dart';
import 'package:flutter/material.dart';

class GridButtonsWidget extends StatelessWidget {
  const GridButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        children: [
          GridButtonWidget(label: 'Abastecer', onPressed: () {Navigator.of(context).pushNamed('/refueling');},),
          GridButtonWidget(label: 'Foto',onPressed: () {print('tirar foto');},),
          GridButtonWidget(label: 'Manutenção',),
        ],
      ),
    );
  }
}
