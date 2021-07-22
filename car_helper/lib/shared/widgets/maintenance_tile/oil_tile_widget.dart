import 'package:car_helper/shared/models/oil_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/filter_checkbox_tile/filter_checkbox_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OilTileWidget extends StatelessWidget {
  final OilModel oil;

  const OilTileWidget({Key? key, required this.oil}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.contrastBackground),
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
                        oil.date,
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
                    oil.odometer,
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
            height: 15,
          ),
          Text(
            'Troca de Óleo',
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
                'Óleo ${oil.oil}',
                style: GoogleFonts.lexendDeca(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              Text(
                'Total R\$ ${oil.value.toStringAsFixed(2)}',
                style: GoogleFonts.lexendDeca(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          FilterCheckboxTileWidget(
              filter: oil.oilFilter,
              onChanged: (_) {},
              label: 'Filtro de Óleo'),
          FilterCheckboxTileWidget(
              filter: oil.airFilter, onChanged: (_) {}, label: 'Filtro de Ar'),
          FilterCheckboxTileWidget(
              filter: oil.gasFilter,
              onChanged: (_) {},
              label: 'Filtro de Combustível'),
          FilterCheckboxTileWidget(
              filter: oil.airCFilter,
              onChanged: (_) {},
              label: 'Filtro de Ar Condicionado'),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
