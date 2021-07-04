import 'dart:io';

import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/widgets/grid_button/grid_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

class GridButtonsWidget extends StatefulWidget {
  final CarModel car;
  const GridButtonsWidget({Key? key, required this.car}) : super(key: key);

  @override
  _GridButtonsWidgetState createState() => _GridButtonsWidgetState();
}

class _GridButtonsWidgetState extends State<GridButtonsWidget> {
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

    Provider.of<CarsProvider>(context, listen: false).addPhoto(imageFile.path, widget.car);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        children: [
          GridButtonWidget(
            label: 'Abastecer',
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/refueling', arguments: widget.car);
            },
          ),
          GridButtonWidget(
            label: 'Foto',
            onPressed: _takePicture,
          ),
          GridButtonWidget(
            label: 'Manutenção',
          ),
        ],
      ),
    );
  }
}
