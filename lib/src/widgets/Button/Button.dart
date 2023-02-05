import 'package:flutter/cupertino.dart';
import 'package:shopper/src/theme/fonts.dart';

class Button extends StatefulWidget {
  const Button({Key? key, required this.color, required this.title, required this.textColor}) : super(key: key);
  final Color color;
  final Color textColor;
  final String title;
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Text(
        widget.title,
        style: TextStyle(
            fontSize: 18.0,
            fontFamily: Fonts.semibold,
            color: widget.textColor
        ),
      ),
    );
  }
}
