import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/models/refueling_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RefuelingCardWidget extends StatelessWidget {
  final CarModel data;
  const RefuelingCardWidget({ Key? key, required this.data }) : super(key: key);

  
  String media(List<RefuelingModel> data) {

    if(data.length == 1){
      return '---';
    }
    int i = data.length - 1;

    double num = (double.parse(data[i].odometer) - double.parse(data[i-1].odometer));
    double den = data[i].total / data[i].price;

    print(num);
print(den);
    return (num/den).toStringAsFixed(2) + ' Km/L';
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return  Container(
      width: double.infinity,
      height: height/5,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: AppColors.primary
       ),
       padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Último Abastecimento',
            style: GoogleFonts.lexendDeca(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            )
          ),
          Text(
            'Último Abastecimento\n${data.refuelings == null ? '---' : data.refuelings![data.refuelings!.length-1].date}', 
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )
          ),
          Text(
            'Valor\nR\$ ${data.refuelings == null ? '---' : data.refuelings![data.refuelings!.length-1].total}', 
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )
          ),
          Text(
            'Média\n ${data.refuelings == null ? '---' : media(data.refuelings!)}', 
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )
          ),
        ],
      ),
    );
  }
}