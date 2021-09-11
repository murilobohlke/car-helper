import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/secondary_button/secondary_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogCombustiveis extends StatefulWidget {

  final List<String> combustiveis;
  final int value;
  
  const DialogCombustiveis(this.combustiveis, this.value);

  @override
  _DialogCombustiveisState createState() => _DialogCombustiveisState();
}

class _DialogCombustiveisState extends State<DialogCombustiveis> {

  int value = -1;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Selecione um combustível',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexendDeca(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  child: ListView.builder(
                    itemCount: widget.combustiveis.length,
                    itemBuilder:(context, index) {
                      return Container(
                        height: 40,
                        child: RadioListTile(
                            activeColor: AppColors.tertiary,
                            title: Text(
                              widget.combustiveis[index],
                                style: GoogleFonts.lexendDeca(
                                  fontSize: 15,
                                  color: Colors.grey[800],
                                )
                            ),
                            value: index,
                            groupValue: value, 
                            onChanged: (ind) => setState(() => value = widget.combustiveis.indexOf(widget.combustiveis[index]))
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SecondaryButtonWidget(
                          label: 'Cancelar',
                          onPressed: (){
                            Navigator.pop(context);
                          }
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: PrimaryButtonWidget(
                          label: 'Confirmar',
                          onPressed: (){
                            Navigator.pop(context, widget.combustiveis[value]);
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}