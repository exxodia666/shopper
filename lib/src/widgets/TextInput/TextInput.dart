import 'package:flutter/material.dart';
import 'package:shopper/src/theme/colors.dart';
import 'package:shopper/src/theme/fonts.dart';

class TextInput extends StatefulWidget {
  const TextInput({Key? key, required this.icon, required this.placeholder}) : super(key: key);
  final Icon icon;
  final String placeholder;
  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 24.0),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Color.fromRGBO(12, 26, 74, 0.24), spreadRadius: 1),
          ],
      ),
        child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: widget.icon,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: widget.placeholder,
                    hintStyle: const TextStyle(
                      fontSize: 18.0,
                      fontFamily: Fonts.semibold,
                      color: CustomColors.placeholder
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),

      );
  }
}
