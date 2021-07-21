import 'package:car_helper/shared/models/refueling_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/dismissible/dismissible_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RefuelingTileWidget extends StatelessWidget {
  final RefuelingModel ref;
  final String id;
  const RefuelingTileWidget({Key? key, required this.ref, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissibleWidget(
        ref:ref,
        text: 'A informação será excluída, você confirma?',
        id: id,
        child: Card(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 6,
            child: Container(
            //margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.contrastBackground,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.solidCalendarAlt,
                            color: AppColors.secondary, size: 18),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          ref.date,
                          style: GoogleFonts.lexendDeca(
                            fontSize: 13,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.solidClock,
                            color: AppColors.secondary, size: 18),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          ref.hour,
                          style: GoogleFonts.lexendDeca(
                            fontSize: 13,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.tachometerAlt,
                            color: AppColors.secondary, size: 18),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          ref.odometer,
                          style: GoogleFonts.lexendDeca(
                            fontSize: 13,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Gasolina ${ref.type}',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.tertiary,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Preço Litro R\$ ${ref.price}',
                      style: GoogleFonts.lexendDeca(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    Text(
                      'Total R\$ ${ref.total}',
                      style: GoogleFonts.lexendDeca(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
