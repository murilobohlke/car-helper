import 'dart:io';

import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/secondary_button/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarTileWidget extends StatelessWidget {
  final CarModel data;
  const CarTileWidget(this.data);

  @override
  Widget build(BuildContext context) {
    var img = File(data.image!);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/info_car', arguments: data);
      },
      child: Dismissible(
        key: ValueKey(data.id),
        background: Container(
          color: Colors.red[700],
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Icon(
            FontAwesomeIcons.trash,
            color: Colors.white,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (_) {
          return showDialog(
            context: context, 
            builder: (ctx) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Cuidado!',
                      style: GoogleFonts.lexendDeca(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      )
                    ),
                    Text(
                      'O carro será excluído, você confirma?',
                      style: GoogleFonts.lexendDeca(
                        fontSize: 15,
                        color: Colors.grey[800],
                      )
                    ),
                    Row(
                      children: [
                        Expanded(child: SecondaryButtonWidget(label: 'Não', onPressed: () {Navigator.of(ctx).pop(false);})),
                        SizedBox(width: 10,),
                        Expanded(child: PrimaryButtonWidget(label: 'Sim', onPressed: () {Navigator.of(ctx).pop(true);})),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
          );
        },
        onDismissed: (_) {
          Provider.of<CarsProvider>(context, listen: false).deleteCar(data.id!);
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primary,
            ),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      img,
                      height: double.infinity,
                      width: 120,
                      fit: BoxFit.cover,
                    )),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.model!,
                          style: GoogleFonts.lexendDeca(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.brand!,
                          style: GoogleFonts.lexendDeca(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
