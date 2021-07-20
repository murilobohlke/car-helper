import 'dart:io';

import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String image = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.file(
              File(image),
                
            ),
          ),
          SizedBox(height: 10,),
          IconButton(onPressed: (){
            Share.shareFiles([image], text: 'Imagem incrível');
          }, icon: Icon(Icons.share, color: AppColors.tertiary,))
        ],
      ),
    );
  }
}
