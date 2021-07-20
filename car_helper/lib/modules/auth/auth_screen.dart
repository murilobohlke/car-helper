import 'package:animated_card/animated_card.dart';
import 'package:car_helper/shared/models/auth_model.dart';
import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:car_helper/shared/widgets/auth_form/auth_form_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({ Key? key }) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;

  Future<void> _handleSubmit (AuthModel authModel) async {
    setState(() {
      isLoading = true;
    });

    try {
      if(authModel.isLogin) {
       UserCredential result = await _auth.signInWithEmailAndPassword(
         email: authModel.email!, 
         password: authModel.password!
        );

        if(result.user!=null){
          Navigator.of(context).pushReplacementNamed('/home');
        }
    } else{
       await _auth.createUserWithEmailAndPassword(
         email: authModel.email!, 
         password: authModel.password!
        );
    }
    } catch (_){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Ocorreu um erro! Revise as informações.',
          textAlign: TextAlign.center,
          style: GoogleFonts.lexendDeca(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
        ),
        backgroundColor: Colors.red[700],
      ));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(top:50, bottom: 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[AppColors.primary, AppColors.tertiary],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
                      child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedCard(
                  direction: AnimatedCardDirection.right,
                  child: Stack(
                    children: [
                      AuthFormWidget(_handleSubmit),
                      if(isLoading)
                      Positioned.fill(
                        child: Container(
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(child: CircularProgressIndicator(color: AppColors.secondary,)),
                        )
                      )
                    ], 
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
  }
}