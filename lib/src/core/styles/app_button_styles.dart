import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButtonStyles {

  static Widget iconStyle({required IconData iconData, double size = SizeIcon.size22, required Color color}) =>
      Icon(
        iconData,
        size: size,
        color: color,
      );

}