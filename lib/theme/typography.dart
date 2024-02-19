import 'package:flutter/cupertino.dart';

import 'colors.dart';
import 'fonts.dart';

class TypographyCustom {
  static Widget regular(
      {required String text,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      TextOverflow? overflow,
      double? height}) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: Fonts.regular,
          fontWeight: fontWeight,
          fontSize: fontSize ?? 16,
          color: color ?? CustomColors.black,
          overflow: overflow,
          height: height),
    );
  }

  static Widget medium(
      {required String text,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      TextOverflow? overflow,
      double? height}) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: Fonts.medium,
          fontWeight: fontWeight,
          fontSize: fontSize ?? 16,
          color: color ?? CustomColors.black,
          overflow: overflow,
          height: height),
    );
  }

  static Widget semiBold(
      {required String text,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      TextOverflow? overflow}) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: Fonts.semibold,
          fontWeight: fontWeight,
          fontSize: fontSize ?? 16,
          color: color ?? CustomColors.black,
          overflow: overflow),
    );
  }
}
