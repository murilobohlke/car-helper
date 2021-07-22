import 'package:car_helper/shared/widgets/social_login/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OthersLoginWidget extends StatelessWidget {
  const OthersLoginWidget({Key? key}) : super(key: key);

  Future<void> googleSingIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      print(response);
      if (response != null) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SocialLoginButton(
              img: AssetImage('assets/images/google.png'),
              onTap: () {
                googleSingIn(context);
              },
              label: 'Entrar com Google',
            ),
            SizedBox(
              height: 10,
            ),
            SocialLoginButton(
              img: AssetImage('assets/images/facebook.png'),
              onTap: () {
                googleSingIn(context);
              },
              label: 'Entrar com Facebook',
            ),
          ],
        ),
      ),
    );
  }
}
