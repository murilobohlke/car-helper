
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/app_bar_home/app_bar_home_widget.dart';
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
        appBar: AppBarHomeWidget(height),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 10),
          child: Column(
            children: [
              Text('Meus Carros',
                style: GoogleFonts.lexendDeca(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                )
              ),
              Container(
                width: 60,
                height: 3,
                color: AppColors.tertiary.withOpacity(0.8),
                margin: EdgeInsets.symmetric(vertical: 5),
              ),
              Expanded(
                child: FutureBuilder(
                  future: Provider.of<CarsProvider>(context, listen: false).loadCars(),
                  builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting
                    ? Center(child: CircularProgressIndicator(color: AppColors.tertiary,),) 
                    : Consumer<CarsProvider> (
                      builder: (ctx, cars, ch) => cars.itemsCount == 0 ? Center(
                        child: Text(
                          'Nenhum carro cadastrado!',
                          style: GoogleFonts.lexendDeca(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          )
                        )
                      ) : ListView.builder(
                        itemCount: cars.itemsCount,
                        itemBuilder: (context, i) {
                          return  CarTileWidget(cars.itemByIndex(i));
                        }
                      )
                    ),
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
