import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// <>
class AppTextStyles {

  static Widget autoTitleStyle({
    required String text,
    required Color color,
    double size = SizeIcon.size26,
    int maxLines = 1,
    TextAlign textAlign = TextAlign.center
  }) =>
      AutoSizeText(
        text,
        style: titleStyle(color: color, size: size),
        maxLines: maxLines,
        minFontSize: 18,
        maxFontSize: 100,
        textAlign: textAlign,
      );

  static TextStyle titleStyle({required Color color, required double size}) =>
      TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: size,
      );

  static Widget autoBodyStyle({
    required String text,
    required Color color,
    double size = SizeIcon.size18,
    int maxLines = 1,
    TextAlign textAlign = TextAlign.justify,
    double horizontal = 0,
    double vertical = 0,
    FontWeight fontWeight = FontWeight.w500
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: AutoSizeText(
          text,
          style: bodyStyle(color: color, size: size, fontWeight: fontWeight),
          maxLines: maxLines,
          minFontSize: 8,
          maxFontSize: 60,
          textAlign: textAlign,
        ),
      );

  static TextStyle bodyStyle({required Color color, required double size, FontWeight fontWeight = FontWeight.w500}) =>
      TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: size
      );

  static Widget autoButtonStyle({
    required String text,
    required Color color,
    double size = SizeIcon.size22,
  }) =>
      AutoSizeText(
        text,
        style: buttonStyle(color: color, size: size,),
        maxLines: 1,
        minFontSize: 18,
        maxFontSize: 28,
        textAlign: TextAlign.center,
      );

  static TextStyle buttonStyle({required Color color, required double size}) =>
      TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: size
      );

}

class SizeIcon {

  static const size10 = 10.0;
  static const size12 = 12.0;
  static const size14 = 14.0;
  static const size16 = 16.0;
  static const size18 = 18.0;
  static const size20 = 20.0;
  static const size22 = 22.0;
  static const size26 = 26.0;
  static const size30 = 30.0;

}