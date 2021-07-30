import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/providers/cars_provider.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/filter_checkbox_tile/filter_checkbox_tile_widget.dart';
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

class OilExpansionTileWidget extends StatefulWidget {
  final CarModel car;
  const OilExpansionTileWidget({ Key? key, required this.car }) : super(key: key);

  @override
  _OilExpansionTileWidgetState createState() => _OilExpansionTileWidgetState();
}

class _OilExpansionTileWidgetState extends State<OilExpansionTileWidget> {
  bool oilFilter = false;
  bool airFilter = false;
  bool gasFilter = false;
  bool airCFilter = false;

  TextEditingController odometerOil = TextEditingController();
  TextEditingController oilOil = TextEditingController();
  TextEditingController valueOil =
  MoneyMaskedTextController(leftSymbol: 'R\$ ', decimalSeparator: '.');

  DateTime _selectedDate = DateTime.now();
  final _formOil = GlobalKey<FormState>();

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
          'Troca de Óleo e Filtros',
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
                key: _formOil, 
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
                      keyboard: TextInputType.number,
                      controller: odometerOil,
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
                      controller: oilOil,
                      label: 'Óleo',
                      icon: FontAwesomeIcons.filter,
                      whiteColor: true,
                    ),
                    TextInputWidget(
                      keyboard: TextInputType.number,
                      controller: valueOil,
                      label: 'Valor',
                      icon: FontAwesomeIcons.moneyBill,
                      whiteColor: true,
                      validator: (value) {
                        if (double.parse(value!.replaceAll('R\$', ''))==0.00) {
                          return 'Insira um valor';
                        }
                        return null;
                      },
                    ),
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
                    SizedBox(height:35,),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButtonWidget(
                            label: 'Limpar',
                            onPressed: () {
                              odometerOil.text = '';
                              oilOil.text = '';
                              valueOil.text = '0.00';
                              setState(() {
                                oilFilter = false;
                                airFilter = false;
                                gasFilter = false;
                                airCFilter = false;
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
                              if (_formOil.currentState!.validate()) {
                                Provider.of<CarsProvider>(context, listen: false).addOil(
                                  DateFormat('dd/MM/yyyy').format(_selectedDate),
                                  odometerOil.text,
                                  oilOil.text,
                                  double.parse(valueOil.text.replaceAll('R\$', '')),
                                  oilFilter,
                                  airFilter,
                                  gasFilter,
                                  airCFilter,
                                  widget.car
                                );
                                
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