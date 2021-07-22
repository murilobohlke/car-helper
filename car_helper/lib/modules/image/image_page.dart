import 'dart:io';

import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

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
              height: MediaQuery.of(context).size.height / 1.8,
              width: double.infinity,
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
