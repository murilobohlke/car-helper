import 'package:car_helper/modules/info_car/info_car_gallery/info_car_gallery_page.dart';
import 'package:car_helper/modules/info_car/info_car_home/info_car_home_page.dart';
import 'package:car_helper/modules/info_car/info_car_info/info_car_info_page.dart';
import 'package:car_helper/modules/info_car/info_car_maintenance/info_car_maintenance_page.dart';
import 'package:car_helper/modules/info_car/info_car_refueling/info_car_refueling_page.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoCarPage extends StatefulWidget {
  const InfoCarPage({Key? key}) : super(key: key);

  @override
  _InfoCarPageState createState() => _InfoCarPageState();
}

class _InfoCarPageState extends State<InfoCarPage> {
  int _selectedIndex = 2;
  CarModel car = CarModel();
  bool isLoading = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    if (isLoading) {
      car = ModalRoute.of(context)!.settings.arguments as CarModel;
      isLoading = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    return Scaffold(
      appBar: AppBar(
        title: Text(car.model!),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                var newCar = await Navigator.of(context)
                    .pushNamed('/add_car', arguments: car);
                car = newCar as CarModel;
                print(newCar);
                _onItemTapped(2);
              },
              icon: Icon(FontAwesomeIcons.cog))
        ],
      ),
      body: [
        InfoCarRefuelingPage(car: car),
        InfoCarMaintencePage(car),
        InfoCarHomePage(car: car,),
        InfoCarGalleryPage(car: car,),
        InfoCarInfoPage(car),
      ][_selectedIndex],
      bottomNavigationBar:  BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.contrastBackground,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gasPump),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.tools),
            label: 'Manutenção',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              FontAwesomeIcons.home,
              color: AppColors.tertiary,
            ),
            icon: Icon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.image),
            label: 'Galeria',
          ),
            BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.info),
            label: 'Informações',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.secondary,
        onTap: _onItemTapped,
      ));
  }
}
