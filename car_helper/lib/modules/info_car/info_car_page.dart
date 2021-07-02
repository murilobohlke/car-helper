import 'package:car_helper/modules/info_car/info_car_gallery/info_car_gallery_page.dart';
import 'package:car_helper/modules/info_car/info_car_home/info_car_home_page.dart';
import 'package:car_helper/modules/info_car/info_car_refueling/info_car_refueling_page.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoCarPage extends StatefulWidget {
  const InfoCarPage({ Key? key }) : super(key: key);

  @override
  _InfoCarPageState createState() => _InfoCarPageState();
}

class _InfoCarPageState extends State<InfoCarPage> {  
  int _selectedIndex = 1;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final CarModel car = ModalRoute.of(context)!.settings.arguments as CarModel;

     SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)
  ); 
    return Scaffold(
      appBar: AppBar(
        title: Text(car.model!),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.cog))
        ],
      ),
      body:[InfoCarRefuelingPage(), InfoCarHomePage(car: car,), InfoCarGalleryPage()][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gasPump),
            label: 'Histórico',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.image),
            label: 'Galeria',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.secondary,
        onTap: _onItemTapped,
      ),
    );
  }
}