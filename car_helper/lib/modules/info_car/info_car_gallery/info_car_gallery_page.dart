
import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/widgets/staggered_grid_view/staggered_grid_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCarGalleryPage extends StatelessWidget {
  final CarModel car;
  const InfoCarGalleryPage({ Key? key, required this.car }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.top,
      child: Container(
        margin: EdgeInsets.only(left:20, right: 20, top:10),
        child: Center(
          child: car.images == null 
          ? Text(
            'Sem Fotos',
            style: GoogleFonts.lexendDeca(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            )
          )
          :  StaggeredGridViewWidget(car: car)
        ),
      ),
    );
  }
}