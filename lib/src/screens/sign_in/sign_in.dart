import 'package:flutter/material.dart';
import 'package:shopper/src/navigation/routes.dart';
import 'package:shopper/src/theme/colors.dart';
import 'package:shopper/src/theme/fonts.dart';
import 'package:shopper/src/widgets/Button/button.dart';
import 'package:shopper/src/widgets/text_input/text_input.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const SizedBox(
              width: 76.0,
              height: 76.0,
            ),
            const Spacer(
              flex: 2,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 44.0),
              child: Text(
                'Login to Shopper',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: Fonts.semibold,
                    color: CustomColors.black),
              ),
            ),
            const TextInput(
              icon: Icon(Icons.person),
              placeholder: 'Email',
            ),
            const TextInput(
              icon: Icon(Icons.lock),
              placeholder: 'Password',
            ),
            Button(
              title: 'Login',
              color: CustomColors.primary,
              textColor: CustomColors.white,
              onPress: () {
                print('Fire');
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: CustomColors.lightGrey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        'Or',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: Fonts.regular,
                            color: CustomColors.lightGrey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: CustomColors.lightGrey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  const Spacer(),
                  const Text(
                    'Don’t have an account? ',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: Fonts.medium,
                        color: CustomColors.lightGrey),
                  ),
                  InkWell(
                      onTap: () {
                        navigateTo(context, Routes.signUp);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: Fonts.medium,
                            color: CustomColors.primary),
                      )),
                  const Spacer(),
                ],
              ),
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
