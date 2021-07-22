import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class MaintenanceTileWidget extends StatelessWidget {
  const MaintenanceTileWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        height: 200,
        child: Column(
          children: [
            Text('oi')
          ],
        ),
      ),
      
    );
  }
}