import 'package:flutter/material.dart';
import 'package:shopper/theme/typography.dart';

class Button extends StatefulWidget {
  const Button(
      {Key? key,
      required this.color,
      required this.title,
      required this.textColor,
      required this.onPress})
      : super(key: key);

  final Color color;
  final Function onPress;
  final Color textColor;
  final String title;
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPress();
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(10.0)),
        child: TypographyCustom.semiBold(
            text: widget.title, fontSize: 18.0, color: widget.textColor),
      ),
    );
  }
}
