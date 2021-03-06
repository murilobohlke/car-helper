

import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/app_bar_home/app_bar_home_widget.dart';
import 'package:car_helper/shared/widgets/carousel_car/carousel_car_widget.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
                  future: Provider.of<CarsProvider>(context, listen: false)
                      .loadCars(),
                  builder: (context, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.tertiary,
                          ),
                        )
                      : Consumer<CarsProvider>(
                          builder: (ctx, cars, ch) => cars.itemsCount == 0
                              ? Center(
                                  child: Text('Nenhum carro cadastrado!',
                                      style: GoogleFonts.lexendDeca(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                      )))
                              // : ListView.builder(
                              //     itemCount: cars.itemsCount,
                              //     itemBuilder: (context, i) {
                              //       return Container(
                              //         margin:
                              //             EdgeInsets.symmetric(vertical: 10),
                              //         child: AnimatedCard(
                              //             direction:
                              //                 AnimatedCardDirection.right,
                              //             child: CarTileWidget(
                              //                 cars.itemByIndex(i))),
                              //       );
                              //     })
                              : AnimatedCard(
                                direction: AnimatedCardDirection.bottom,
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: height * 0.45,
                                    enableInfiniteScroll: true,
                                  ),
                                  items: cars.items.map((item) => Container(
                                     margin: EdgeInsets.symmetric(horizontal: 4),
                                      child: CarouselCarWidget(item, height)
                                    )
                                  )
                                   .toList(),
                                ),
                              )
                                ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(width: 50,),
                  Expanded(
                      child: PrimaryButtonWidget(
                        label: 'Adicionar Carro',
                        onPressed: () => Navigator.of(context).pushNamed('/add_car')
                        ),
                  ),
                  SizedBox(width: 50,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
