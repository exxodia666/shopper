import 'package:flutter/material.dart';
// import 'package:shopper/navigation/routes.dart';
import 'package:shopper/theme/colors.dart';

class BottomBarButton extends StatelessWidget {
  const BottomBarButton(
      {Key? key,
      required this.selectedIndex,
      required this.index,
      required this.icon,
      required this.onPress})
      : super(key: key);

  final int index;
  final int selectedIndex;
  final IconData icon;
  final Function(int) onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress(index);
      },
      child: Icon(
        icon,
        color: selectedIndex == index
            ? CustomColors.primary
            : CustomColors.lightGrey,
      ),
    );
  }
}
