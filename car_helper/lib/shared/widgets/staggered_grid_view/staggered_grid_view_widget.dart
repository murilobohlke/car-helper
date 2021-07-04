import 'dart:io';

import 'package:car_helper/shared/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridViewWidget extends StatelessWidget {
  final CarModel car;
  const StaggeredGridViewWidget({Key? key, required this.car})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: car.images!.length,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 3 : 2),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/image', arguments: car.images![index]);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.file(
              File(car.images![index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      
    );
    // return ;
  }
}
