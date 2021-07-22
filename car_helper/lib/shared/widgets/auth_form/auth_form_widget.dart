import 'package:car_helper/shared/models/auth_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:car_helper/shared/widgets/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthFormWidget extends StatefulWidget {
  final void Function(AuthModel authModel) onSubmit;

  const AuthFormWidget(this.onSubmit);

  @override
  _AuthFormWidgetState createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  final AuthModel _authModel = AuthModel();
  final GlobalKey<FormState> _formKey = GlobalKey();

  _submit() {
    bool isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      widget.onSubmit(_authModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset('assets/images/car.png', width: 120, height: 60,),
              Text(
                'Car Helper',
                style: GoogleFonts.lexendDeca(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.tertiary,
              )
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    if (_authModel.isSignup)
                    TextInputWidget(
                      key: ValueKey('name'),
                      label: 'Nome', 
                      icon: FontAwesomeIcons.user,
                      onChanged: (value) => _authModel.name = value
                    ),
                    TextInputWidget(
                      textCapt: TextCapitalization.none,
                      key: ValueKey('email'),
                      label: 'Email', 
                      icon: FontAwesomeIcons.envelope,
                      onChanged: (value) => _authModel.email = value
                    ),
                    TextInputWidget(
                      textCapt: TextCapitalization.none,
                      key: ValueKey('password'),
                      label: 'Senha',
                      obscure: true,
                      icon: FontAwesomeIcons.key,
                      onChanged: (value) => _authModel.password = value
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PrimaryButtonWidget(
                        label: _authModel.isLogin ? 'Entrar' : 'Cadastrar',
                        onPressed: _submit),
                    SizedBox(height: 20,),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _authModel.toggleMode();
                          });
                        },
                        child: Text(_authModel.isLogin
                            ? 'Criar nova conta?'
                            : 'Já possui conta?',
                            style: GoogleFonts.lexendDeca(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondary,
                          )
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
    );
  }
}
