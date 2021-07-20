import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/secondary_button/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceTileWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const MaintenanceTileWidget({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ExpansionTile(
        title: Text(
          title,
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
                child,
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: SecondaryButtonWidget(label: 'Limpar', onPressed: (){})),
                    SizedBox(width: 20,),
                    Expanded(child: PrimaryButtonWidget(label: 'Salvar', onPressed: (){}))
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
