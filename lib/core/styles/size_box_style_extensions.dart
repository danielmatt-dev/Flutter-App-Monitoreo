import 'package:flutter/material.dart';

extension SizeBoxExtensions on String {

  Widget sizeBox({
    required double height,
    double percentage = 0.0010
  }) =>
      SizedBox(height: height * percentage);

}