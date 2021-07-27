
import 'package:car_helper/shared/models/refueling_model.dart';
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/secondary_button/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DismissibleWidget extends StatelessWidget {
  final String id;
  final RefuelingModel? ref;
  final String? idImg;
  final Widget child;
  final String text;
  final del;

  DismissibleWidget(
      {required this.id,
      this.ref,
      this.idImg,
      required this.child,
      required this.text,
      this.del});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(id),
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red[700],
          ),
          //margin: EdgeInsets.symmetric(vertical: 10),
          child: Icon(
            FontAwesomeIcons.trash,
            color: Colors.white,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (_) {
          return showDialog(
              context: context,
              builder: (ctx) => Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Cuidado!',
                                style: GoogleFonts.lexendDeca(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                )),
                            Text(text,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lexendDeca(
                                  fontSize: 15,
                                  color: Colors.grey[800],
                                )),
                            Row(
                              children: [
                                Expanded(
                                    child: SecondaryButtonWidget(
                                        label: 'Não',
                                        onPressed: () {
                                          Navigator.of(ctx).pop(false);
                                        })),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: PrimaryButtonWidget(
                                        label: 'Sim',
                                        onPressed: () {
                                          Navigator.of(ctx).pop(true);
                                        })),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
        },
        onDismissed: (_) {
          if (ref != null) {
            Provider.of<CarsProvider>(context, listen: false)
                .deleteRefueling(ref!, id);
          } else if (idImg != null) {
            Provider.of<CarsProvider>(context, listen: false)
                .deleteImage(idImg!, id);
          } else if (del != null) {
            Provider.of<CarsProvider>(context, listen: false).deleteMaintenance(del, id);
          }
          else{
            Provider.of<CarsProvider>(context, listen: false).deleteCar(id);
          }
        },
        child: child);
  }
}
