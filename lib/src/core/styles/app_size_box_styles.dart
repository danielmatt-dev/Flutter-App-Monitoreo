import 'package:flutter/material.dart';

class AppSizeBoxStyle {

  static Widget sizeBox({required double height, double percentage = 0.0010}) =>
      SizedBox(
        height: height * percentage,
      );
  
}