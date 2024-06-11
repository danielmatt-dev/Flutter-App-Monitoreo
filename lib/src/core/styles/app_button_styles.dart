import 'package:flutter/material.dart';

class AppButtonStyles {

  static Widget iconStyle({required IconData iconData, required double height, double percentage = 0.05, required Color color}) =>
      Icon(
        iconData,
        size: height * percentage,
        color: color,
      );

}