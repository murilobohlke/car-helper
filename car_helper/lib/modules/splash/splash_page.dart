import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void delay(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacementNamed('/home');

    // FirebaseAuth.instance
    //   .authStateChanges()
    //   .listen((User? user) {
    //     if (user == null) {
    //       Navigator.of(context).pushReplacementNamed('/auth');
    //     } else {
    //       Navigator.of(context).pushReplacementNamed('/home');
    //     }
    //   });
  }

  @override
  void initState() {
    delay(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

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
