
import 'package:car_helper/modules/home/home_page_controller.dart';
import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/car_tile/car_tile_widget.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(height / 3),
            child: Container(
                height: height / 3,
                child: Stack(
                  children: [
                    Container(
                        height: height / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              AppColors.primary,
                              AppColors.tertiary
                            ],
                          ),
                        )),
                    Positioned(
                        top: 90,
                        left: 0,
                        right: 0,
                        child: Center(
                            child: Text('Car Helper',
                                style: GoogleFonts.lexendDeca(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )))),
                    Positioned(
                        top: 140,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/car.png',
                          width: 200,
                          height: 100,
                        ))
                  ],
                ))),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 10),
          child: Column(
            children: [
              Text('Meus Carros',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  )),
              Container(
                width: 60,
                height: 3,
                color: AppColors.tertiary.withOpacity(0.8),
                margin: EdgeInsets.symmetric(vertical: 5),
              ),
              Expanded(
                child: FutureBuilder(
                  future: Provider.of<HomePageController>(context, listen: false).loadCars(),
                  builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting
                    ? Center(child: CircularProgressIndicator(),) 
                    : Consumer<HomePageController> (
                      builder: (ctx, cars, ch) => cars.itemsCount == 0 ? Center(
                        child: Text('Nenhum carro cadastrado!')
                    ) : ListView.builder(
                    itemCount: cars.itemsCount,
                    itemBuilder: (context, i) {
                      return  CarTileWidget(cars.itemByIndex(i));
                    }
                  )),
                ),
              ),
              SizedBox(height: 10,),
              PrimaryButtonWidget(
                label: 'Adicionar Carro',
                onPressed: () {
                  Navigator.of(context).pushNamed('/add_car');
                }
              )           
            ],
          ),
        ),
       
      ),
    );
  }
}
