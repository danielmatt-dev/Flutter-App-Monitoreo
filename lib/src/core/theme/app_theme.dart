import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

// <>
class AppTheme {

  final bool isDarkMode;

  AppTheme({this.isDarkMode = false});

  ThemeData getThemeData(double height) {
    return isDarkMode ? _getDarkTheme(height) : _getLightTheme(height);
  }

  ThemeData _getLightTheme(double height) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: colorSchemeLight.surface,
            systemNavigationBarColor: colorSchemeLight.surface,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark
        )
    );

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
          iconTheme: WidgetStateProperty.all(
              IconThemeData(size: height * 0.04, color: LightColors.primary))
      ),
    );
  }
  
  ThemeData _getDarkTheme(double height) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: colorSchemeDark.surface,
            systemNavigationBarColor: colorSchemeDark.surface,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light
        )
    );

    return ThemeData(
        useMaterial3: true,
        colorScheme: colorSchemeDark,
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade800,
          indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          labelTextStyle: _getLabelTextStyle(DarkColors.primary, height),
          iconTheme: WidgetStateProperty.all(
              IconThemeData(size: height * 0.04, color: DarkColors.primary)),
        )
    );
  }

  WidgetStateProperty<TextStyle> _getLabelTextStyle(Color color, double height) {
    return WidgetStateProperty.resolveWith((states) {

        final fontWeight = states.contains(WidgetState.selected)
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
