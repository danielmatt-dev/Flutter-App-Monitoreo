import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension TextStyleExtensions on String {

  Widget autoTitleStyle({
    required Color color,
    required double height,
    TextAlign textAlign = TextAlign.center,
  }) {
    return AutoSizeText(
      this,
      style: _titleStyle(color: color, size: height * 0.04),
      maxLines: 1,
      minFontSize: 22,
      maxFontSize: 30,
      textAlign: textAlign,
    );
  }

  Widget autoBodyStyle({
    required Color color,
    required int maxLines,
    required double height,
    double percent = 0.025,
  }) {
    return AutoSizeText(
      this,
      style: _bodyStyle(color: color, size: height * percent),
      maxLines: maxLines,
      minFontSize: 14,
      maxFontSize: 60,
      textAlign: TextAlign.justify,
    );
  }

  Widget autoButtonStyle({
    required Color color,
    required double height,
  }) {
    return AutoSizeText(
      this,
      style: _buttonStyle(color: color, size: height * 0.03),
      maxLines: 1,
      minFontSize: 18,
      maxFontSize: 28,
      textAlign: TextAlign.center,
    );
  }

  TextStyle _titleStyle({required Color color, required double size}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: size,
    );
  }

  TextStyle _bodyStyle({required Color color, required double size}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: size,
    );
  }

  TextStyle _buttonStyle({required Color color, required double size}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: size,
    );
  }

}