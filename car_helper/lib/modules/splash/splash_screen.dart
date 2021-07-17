import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void delay(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    //Navigator.of(context).pushReplacementNamed('/home');
    Navigator.of(context).pushReplacementNamed('/auth');
  }

  @override
  Widget build(BuildContext context) {
    
    delay(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[AppColors.primary, AppColors.tertiary],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'assets/images/car.png',
              width: 250,
              height: 125,
            ),
            SizedBox(
              height: 30,
            ),
            Text('Car Helper',
                style: GoogleFonts.lexendDeca(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            SizedBox(
              height: 10,
            ),
            Text('Gerencie seus carros',
                style: GoogleFonts.lexendDeca(
                  fontSize: 15,
                  color: Colors.white,
                )),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text('Criado por Murilo Böhlke',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 15,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
