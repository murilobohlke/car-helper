import 'package:car_helper/modules/add_car/add_car_page.dart';
import 'package:car_helper/modules/home/home_page.dart';
import 'package:car_helper/modules/info_car/info_car_page.dart';
import 'package:car_helper/modules/refueling/refueling_page.dart';
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CarsProvider(),
    child: AppWidget()
    )
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

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
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
        "/info_car": (context) => InfoCarPage(),        
        "/refueling": (context) => RefuelingPage(),
        "/add_car": (context) => AddCarPage(),
                
      },
    );
  }
}