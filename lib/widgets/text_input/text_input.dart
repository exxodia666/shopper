import 'package:flutter/material.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/fonts.dart';
import 'package:shopper/theme/typography.dart';

class TextInput extends StatefulWidget {
  const TextInput(
      {Key? key,
      required this.icon,
      required this.placeholder,
      required this.onChanged,
      this.errorText,
      this.obscureText})
      : super(key: key);
  final Icon icon;
  final String placeholder;
  final void Function(String value) onChanged;
  final String? errorText;
  final bool? obscureText;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 24.0),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.white,
            boxShadow: const [
              BoxShadow(color: CustomColors.primaryShadow, spreadRadius: 1),
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
                  obscureText: widget.obscureText ?? false,
                  onChanged: widget.onChanged,
                  decoration: InputDecoration(
                    hintText: widget.placeholder,
                    hintStyle: const TextStyle(
                        fontSize: 18.0,
                        fontFamily: Fonts.semibold,
                        color: CustomColors.placeholder),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        TypographyCustom.regular(text: widget.errorText ?? ''),
      ],
    );
  }
}
