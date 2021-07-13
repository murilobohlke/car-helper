import 'dart:io';

import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/show_text/show_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCarInfoPage extends StatelessWidget {
  final CarModel car;
  const InfoCarInfoPage(this.car);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.top,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Informações',
              style: GoogleFonts.lexendDeca(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              )
            ),
            Container(
              width: 60,
              height: 3,
              color: AppColors.tertiary.withOpacity(0.8),
              margin: EdgeInsets.symmetric(vertical: 5),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/image', arguments: car.image!);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  File(car.image!),
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Spacer(),
            ShowTextWidget(icon: FontAwesomeIcons.car, label: 'Marca', text: car.brand!,),
            SizedBox(height: 15,),
            ShowTextWidget(icon: FontAwesomeIcons.solidStar, label: 'Modelo', text: car.model!,),
            SizedBox(height: 15,),
            ShowTextWidget(icon: FontAwesomeIcons.burn, label: 'Apelido', text: car.nick!,),
            Spacer()
          ]
        )
      )
    );
  }
}
