import 'package:flutter/material.dart';

class ButtonStyleExtensions {

  Widget iconStyle({
    required IconData iconData,
    required double height,
    required Color color,
    double percentage = 0.05
  }) =>
      Icon(
        iconData,
        size: height * percentage,
        color: color,
      );

}