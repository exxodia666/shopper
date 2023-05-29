import 'package:flutter/material.dart';
import 'package:shopper/src/navigation/main_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MainNavigator();
  }
}

