import 'package:flutter/material.dart';
import 'package:shopper/src/screens/SignIn/SignIn.dart';
import 'package:shopper/src/screens/SignUp/SignUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => SignIn(),
        '/signUp': (context) => SignUp(),
      },
      // home: const SignIn(),
    );
  }
}

