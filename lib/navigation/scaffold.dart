import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    required this.child,
    this.header,
    this.bottomAppBar,
    super.key,
  });

  final Widget child;
  final PreferredSizeWidget? header;
  final Widget? bottomAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: child,
      appBar: header,
      bottomNavigationBar: bottomAppBar,
    );
  }
}
