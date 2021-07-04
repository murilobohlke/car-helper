import 'dart:io';

import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class ImageInputWidget extends StatefulWidget {
  final Function onSelectImage;
  final File? img;

  ImageInputWidget({required this.onSelectImage, this.img});

  @override
  _ImageInputWidgetState createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  File? _storedImage;

  _takePicture(bool mode) async {
    final ImagePicker _picker = ImagePicker();
    Navigator.of(context).pop();
    PickedFile? imageFile = await _picker.getImage(
        source: mode ? ImageSource.camera : ImageSource.gallery, maxWidth: 600);

    if (imageFile == null) return;

    setState(() {
      _storedImage = File(imageFile.path);
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    String fileName = path.basename(_storedImage!.path);
    final savedImage = await _storedImage!.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  void _openModal() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
              width: double.infinity,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        _takePicture(true);
                      },
                      icon: Icon(
                        FontAwesomeIcons.cameraRetro,
                        color: AppColors.secondary,
                      ),
                      label: Text(' Tirar Foto',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.tertiary,
                          ))),
                  TextButton.icon(
                      onPressed: () {
                        _takePicture(false);
                      },
                      icon: Icon(
                        FontAwesomeIcons.image,
                        color: AppColors.secondary,
                      ),
                      label: Text('  Escolher da Galeria',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.tertiary,
                          )))
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.img);
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: InkWell(
        onTap: () {
          _openModal();
        },
        child: _storedImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  _storedImage!,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              )
            : widget.img != null 
            ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  widget.img!,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              )
            :Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  FontAwesomeIcons.camera,
                  color: AppColors.tertiary,
                  size: 40,
                ),
              ),
      ),
    );
  }
}
