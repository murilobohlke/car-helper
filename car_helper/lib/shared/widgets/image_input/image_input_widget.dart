import 'dart:io';

import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class ImageInputWidget extends StatefulWidget {
  final Function onSelectImage;

  ImageInputWidget(this.onSelectImage);

  @override
  _ImageInputWidgetState createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  File? _storedImage;

  _takePicture() async {
    final ImagePicker _picker = ImagePicker();

    PickedFile? imageFile =
        await _picker.getImage(source: ImageSource.camera, maxWidth: 600);

    if (imageFile == null) return;

    setState(() {
      _storedImage = File(imageFile.path);
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    String fileName = path.basename(_storedImage!.path);
    final savedImage = await _storedImage!.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  child: InkWell(
                    onTap: _takePicture,
                    child:_storedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          _storedImage!,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                    )
                    : 
                    Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(FontAwesomeIcons.camera, color: AppColors.tertiary, size: 40,),
                    ),
                  ),
                );
  }
}
