import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// <>
class AppTextStyles {

  static Widget autoTitleStyle({
    required String text,
    required Color color,
    required double height,
    double percent = 0.035,
    int maxLines = 1,
    TextAlign textAlign = TextAlign.center
  }) =>
      AutoSizeText(
        text,
        style: titleStyle(color: color, size: height * percent),
        maxLines: maxLines,
        minFontSize: 22,
        maxFontSize: 100,
        textAlign: textAlign,
      );

  static TextStyle titleStyle({required Color color, required double size}) =>
      TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: size
      );

  static Widget autoBodyStyle({
    required String text,
    required Color color,
    int maxLines = 1,
    required double height,
    TextAlign textAlign = TextAlign.justify,
    double percent = 0.025,
    double horizontal = 0,
    double vertical = 0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: AutoSizeText(
          text,
          style: bodyStyle(color: color, size: height * percent),
          maxLines: maxLines,
          minFontSize: 14,
          maxFontSize: 60,
          textAlign: textAlign,
        ),
      );

  static TextStyle bodyStyle({required Color color, required double size}) =>
      TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: size
      );

  static Widget autoButtonStyle(
      {required String text, required Color color, required double height}) =>
      AutoSizeText(
        text,
        style: buttonStyle(color: color, size: height * 0.03),
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