import 'package:flutter/material.dart';
import 'package:shopper/src/theme/colors.dart';
import 'package:shopper/src/theme/fonts.dart';
import 'package:shopper/src/widgets/Button/Button.dart';
import 'package:shopper/src/widgets/TextInput/TextInput.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: CustomColors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leadingWidth: 60,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back, color: CustomColors.black,),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Spacer(flex: 2,),
            Padding(padding: EdgeInsets.only(bottom: 44.0),
              child: Text('Sign in Shopper',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: Fonts.semibold,
                    color: CustomColors.black
                ),
              ),
            ),
            TextInput(icon: Icon(Icons.person), placeholder: 'Email',),
            TextInput(icon: Icon(Icons.lock), placeholder: 'Password',),
            TextInput(icon: Icon(Icons.lock), placeholder: 'Confirmation',),
            Button(
              title: 'Sign Up',
              color: CustomColors.primary,
              textColor: CustomColors.white,
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
