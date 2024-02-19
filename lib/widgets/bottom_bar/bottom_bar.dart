import 'package:flutter/material.dart';
import 'package:shopper/theme/colors.dart';

import '../bottom_bar_button/bottom_bar_button.dart';

class BottomBar extends StatefulWidget {
  const BottomBar(
      {Key? key, required this.selectedIndex, required this.setSelectedIndex})
      : super(key: key);

  final int selectedIndex;
  final Function(int) setSelectedIndex;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> buildList() {
    return [
      BottomBarButton(
        selectedIndex: widget.selectedIndex,
        index: 0,
        icon: Icons.home,
        onPress: widget.setSelectedIndex,
      ),
      BottomBarButton(
        selectedIndex: widget.selectedIndex,
        index: 1,
        icon: Icons.favorite_outline_rounded,
        onPress: widget.setSelectedIndex,
      ),
      BottomBarButton(
        selectedIndex: widget.selectedIndex,
        index: 2,
        icon: Icons.shopping_cart_rounded,
        onPress: widget.setSelectedIndex,
      ),
      BottomBarButton(
        selectedIndex: widget.selectedIndex,
        index: 3,
        icon: Icons.person_4_outlined,
        onPress: widget.setSelectedIndex,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: CustomColors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        alignment: Alignment.center,
        height: 78,
        decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(44.0),
            boxShadow: const [
              BoxShadow(
                  color: CustomColors.primaryShadow,
                  spreadRadius: 0.1,
                  blurRadius: 0.1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildList(),
        ),
      ),
    );
  }
}
