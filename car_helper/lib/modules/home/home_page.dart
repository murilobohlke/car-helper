import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/car_tile/car_tile_widget.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height/3),
          child: Container(
            height: height/3,
            child: Stack(
              children: [
                Container(
                  height: height/4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[AppColors.primary, AppColors.tertiary],
                    ),
                  )
                ),
               Positioned(
                 top: 90,
                 left: 0,
                 right: 0,
                 child: Center(child: Text(
                   'Car Helper',
                   style: GoogleFonts.lexendDeca(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ))
                )
               ),
               Positioned(
                 top: 140,
                 left: 0,
                 right: 0,
                 child: Image.asset('assets/images/car.png', width: 200, height: 100,)
               )
              ],
            )
          )
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
          child: Column(
            children: [
              Text('Meus Carros', style: GoogleFonts.lexendDeca(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                )),
              Container(width: 60, height: 3, color: AppColors.tertiary.withOpacity(0.8), margin: EdgeInsets.symmetric(vertical: 5),),
              CarTileWidget(CarModel(brand: 'Hyundai', model: 'i30', image:  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0tjRb1WP1vOZ-0ePQZa6r-lEKMnHpueeHjw&usqp=CAU')),
              CarTileWidget(CarModel(brand: 'Ford', model: 'Fiesta', image:  'https://imganuncios.mitula.net/ford_fiesta_2012_flex_ford_fiesta_rocam_sedan_1_6_8v_vermelho_20112012_9060123623071659648.jpg')),
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButtonWidget(label: 'Adicionar Carro', onPressed: () {Navigator.of(context).pushNamed('/add_car');})
            ],
          ),
        ),
      ),
    );
  }
}
