import 'package:car_helper/modules/maintenance/maintenance_page.dart';
import 'package:car_helper/modules/splash/splash_page.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'modules/add_car/add_car_page.dart';
import 'modules/auth/auth_page.dart';
import 'modules/home/home_page.dart';
import 'modules/image/image_page.dart';
import 'modules/info_car/info_car_page.dart';
import 'modules/refueling/refueling_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
      ),
      title: 'Car Helper',
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return HomePage();
      //     }
      //     else {
      //       return AuthScreen();
      //     }
      //   },
      // ),
      initialRoute: '/splash',
      routes: {
        "/home": (context) => HomePage(),
        "/info_car": (context) => InfoCarPage(),
        "/refueling": (context) => RefuelingPage(),
        "/add_car": (context) => AddCarPage(),
        "/image": (context) => ImagePage(),
        "/splash": (context) => SplashPage(),
        "/auth": (context) => AuthPage(),
        "/maintenance": (context) => MaintenancePage(),
      },
    );
  }
}
