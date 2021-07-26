import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/filter_checkbox_tile/filter_checkbox_tile_widget.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/secondary_button/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceExpansionTileWidget extends StatefulWidget {
  final String title;
  final Widget child;
  final bool isFilters;
  final Function clean;
  final Function(bool a, bool b, bool c, bool d)? save;
  final Function? save2;

  const MaintenanceExpansionTileWidget(
      {required this.clean,
      required this.title,
      required this.child,
      this.save,
      this.save2,
      this.isFilters = false});

  @override
  _MaintenanceExpansionTileWidgetState createState() =>
      _MaintenanceExpansionTileWidgetState();
}

class _MaintenanceExpansionTileWidgetState
    extends State<MaintenanceExpansionTileWidget> {
  bool oilFilter = false;
  bool airFilter = false;
  bool gasFilter = false;
  bool airCFilter = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: GoogleFonts.lexendDeca(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
          textAlign: TextAlign.center,
        ),
        collapsedBackgroundColor: AppColors.contrastBackground,
        collapsedIconColor: AppColors.secondary,
        iconColor: AppColors.secondary,
        backgroundColor: AppColors.contrastBackground,
        trailing: Icon(FontAwesomeIcons.chevronCircleDown),
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Column(
                children: [
                  widget.child,
                  SizedBox(
                    height: 5,
                  ),
                  if (widget.isFilters)
                    Column(
                      children: [
                        FilterCheckboxTileWidget(
                          label: 'Filtro de Óleo',
                          filter: oilFilter,
                          onChanged: (newValue) {
                            setState(() {
                              oilFilter = newValue;
                            });
                          },
                        ),
                        FilterCheckboxTileWidget(
                          label: 'Filtro de Ar',
                          filter: airFilter,
                          onChanged: (newValue) {
                            setState(() {
                              airFilter = newValue;
                            });
                          },
                        ),
                        FilterCheckboxTileWidget(
                          label: 'Filtro de Combustível',
                          filter: gasFilter,
                          onChanged: (newValue) {
                            setState(() {
                              gasFilter = newValue;
                            });
                          },
                        ),
                        FilterCheckboxTileWidget(
                          label: 'Filtro de Ar Condicionado',
                          filter: airCFilter,
                          onChanged: (newValue) {
                            setState(() {
                              airCFilter = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SecondaryButtonWidget(
                              label: 'Limpar',
                              onPressed: () {
                                setState(() {
                                  widget.clean();
                                  airFilter = false;
                                  airCFilter = false;
                                  oilFilter = false;
                                  gasFilter = false;
                                });
                              })),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: PrimaryButtonWidget(
                              label: 'Salvar',
                              onPressed: () {
                                if (widget.save != null) {
                                  widget.save!(airFilter, airCFilter, oilFilter,
                                      gasFilter);
                                } else {
                                  widget.save2!();
                                }
                              })),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
