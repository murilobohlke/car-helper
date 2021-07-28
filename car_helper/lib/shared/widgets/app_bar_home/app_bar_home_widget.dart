import 'package:car_helper/shared/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarHomeWidget extends PreferredSize {
  final double height;

  AppBarHomeWidget(this.height) : super(child: Text(''), preferredSize: Size.fromHeight(height / 3));

  @override
  Size get preferredSize => Size.fromHeight(height / 3);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height / 3),
      child: Container(
        height: height / 3,
        child: Stack(
          children: [
            Container(
              height: height / 4,
              decoration: BoxDecoration(
                borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[AppColors.primary, AppColors.tertiary],
                ),
              )
            ),
            Positioned(
              top: 90,
              left: 0,
              right: 0,
              child: Center(
                child: Text('Car Helper',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                )
              )
            ),
            // Positioned(
            //   top: 30,
            //   left: 30,
            //   right: 10,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         Text(
            //           'Olá, Murilo',
            //           style: GoogleFonts.lexendDeca(
            //             fontSize: 15,
            //             fontWeight: FontWeight.w100,
            //             color: Colors.white,
            //           )
            //         ),
            //         Spacer(),
            //         IconButton(
            //           onPressed: () { 
            //             FirebaseAuth.instance.signOut();
            //             GoogleSignIn _googleSignIn = GoogleSignIn(
            //               scopes: [ 'email',],
            //             );
            //             _googleSignIn.disconnect();
            //             Navigator.of(context).pushReplacementNamed('/auth');
            //             }, 
            //           icon: Icon(FontAwesomeIcons.timesCircle, color: Colors.white,)
            //         ),
            //       ],
            //     ),
            // ),
            Positioned(
              top: 140,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/car.png',
                width: 200,
                height: 100,
              )
            )
          ],
        )
      )
    );
  }
}