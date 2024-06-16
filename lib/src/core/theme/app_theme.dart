import 'package:flutter/material.dart';
import 'colors.dart';

// <>
class AppTheme {

  final bool isDarkMode;

  AppTheme({this.isDarkMode = false});

  ThemeData getThemeData(double height) {
    return isDarkMode ? _getDarkTheme(height) : _getLightTheme(height);
  }

  ThemeData _getLightTheme(double height) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorSchemeLight,
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: LightColors.surface,
          indicatorColor: Colors.blue.shade200,
          indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          labelTextStyle: _getLabelTextStyle(LightColors.primary, height),
          iconTheme: MaterialStateProperty.all(
              IconThemeData(size: height * 0.04, color: LightColors.primary))
      ),
    );
  }
  
  ThemeData _getDarkTheme(double height) {
    return ThemeData(
        useMaterial3: true,
        colorScheme: colorSchemeDark,
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade800,
          indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          labelTextStyle: _getLabelTextStyle(DarkColors.onPrimary, height),
          iconTheme: MaterialStateProperty.all(
              IconThemeData(size: height * 0.04, color: DarkColors.onPrimary)),
        )
    );
  }

  MaterialStateProperty<TextStyle> _getLabelTextStyle(Color color, double height) {
    return MaterialStateProperty.resolveWith((states) {

        final fontWeight = states.contains(MaterialState.selected)
            ? FontWeight.bold
            : FontWeight.w500;

        return TextStyle(
          fontSize: height * 0.020,
          fontWeight: fontWeight,
          color: color
        );
    });
  }

}
