import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/secondary_button/secondary_button_widget.dart';
import 'package:car_helper/shared/widgets/show_text/show_text_widget.dart';
import 'package:car_helper/shared/widgets/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OtherExpansionTileWidget extends StatefulWidget {
  final CarModel car;
  const OtherExpansionTileWidget({ Key? key, required this.car }) : super(key: key);

  @override
  _OtherExpansionTileWidgetState createState() => _OtherExpansionTileWidgetState();
}

class _OtherExpansionTileWidgetState extends State<OtherExpansionTileWidget> {
  DateTime _selectedDate = DateTime.now();
  final _formOther = GlobalKey<FormState>();
  
  TextEditingController odometerOther = TextEditingController();
  TextEditingController descriptionOther = TextEditingController();
  TextEditingController valueOther = MoneyMaskedTextController(leftSymbol: 'R\$ ', decimalSeparator: '.');
  TextEditingController titleOther = TextEditingController();

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now())
    .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ExpansionTile(
        title: Text(
          'Outra Manutenção',
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
              child: Form(
                key: _formOther, 
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _showDatePicker,
                      child: ShowTextWidget(
                        isWhite: true,
                        cross: CrossAxisAlignment.start,
                        isLeft: true,
                        label: 'Data',
                        textSize: 16,
                        text: DateFormat('dd/MM/yyyy').format(_selectedDate),
                        icon: FontAwesomeIcons.solidCalendarAlt,
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextInputWidget(
                      textAction: TextInputAction.next,
                      controller: odometerOther,
                      label: 'Odômetro',
                      icon: FontAwesomeIcons.tachometerAlt,
                      whiteColor: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O odômetro não pode ser vazio';
                        }
                        return null;
                      },
                    ),
                    TextInputWidget(
                      textAction: TextInputAction.next,
                      controller: titleOther,
                      label: 'Título',
                      icon: FontAwesomeIcons.solidFileAlt,
                      whiteColor: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O título não pode ser vazio';
                        }
                        return null;
                      },
                    ),
                    TextInputWidget(
                      textAction: TextInputAction.next,
                      controller: descriptionOther,
                      label: 'Descrição',
                      icon: FontAwesomeIcons.solidFileAlt,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      controller: valueOther,
                      label: 'Valor',
                      icon: FontAwesomeIcons.moneyBill,
                      whiteColor: true,
                    ),
                    SizedBox(height:20,),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButtonWidget(
                            label: 'Limpar',
                            onPressed: () {
                              odometerOther.text = '';
                              descriptionOther.text = '';
                              valueOther.text = '0.00';
                              titleOther.text = '';

                              setState(() {
                                _selectedDate = DateTime.now();
                              });
                            }
                          )
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: PrimaryButtonWidget(
                            label: 'Salvar',
                            onPressed: () {
                              if (_formOther.currentState!.validate()) {
                                Provider.of<CarsProvider>(context, listen: false).addOther(
                                  DateFormat('dd/MM/yyyy').format(_selectedDate),
                                  odometerOther.text,
                                  titleOther.text,
                                  descriptionOther.text,
                                  double.parse(valueOther.text.replaceAll('R\$', '')),
                                  widget.car);
                                
                                Navigator.of(context).pop();
                              }
                            }
                          )
                        ),
                      ],
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}