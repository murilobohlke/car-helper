import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/secondary_button/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceExpansionTileWidget extends StatefulWidget {
  final String title;
  final Widget child;
  const MaintenanceExpansionTileWidget(
      {required this.title, required this.child});

  @override
  _MaintenanceExpansionTileWidgetState createState() =>
      _MaintenanceExpansionTileWidgetState();
}

class _MaintenanceExpansionTileWidgetState
    extends State<MaintenanceExpansionTileWidget> {
  bool checkedValue = false;

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
                  CheckboxListTile(
                    title: Text("Filtro de Óleo"),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading, 
                  ),
                  CheckboxListTile(
                    title: Text("Filtro de Ar"),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading, 
                  ),
                  CheckboxListTile(
                    title: Text("Filtro de Combustível"),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading, 
                  ),
                  CheckboxListTile(
                    title: Text("Filtro de Ar Condicionado"),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading, 
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SecondaryButtonWidget(
                              label: 'Limpar', onPressed: () {})),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: PrimaryButtonWidget(
                              label: 'Salvar', onPressed: () {})),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
