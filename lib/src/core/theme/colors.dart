import 'package:flutter/material.dart';

class LightColors {

  static const colorLight = Color(0xFFF2F2F2);
  static const primary = Color(0xFF196092);
  static const onPrimary = Color(0xFFF2F2F2);
  static const primaryVariant = Color(0xFF10496F);
  static const secondary = Color(0xFF0377A7);
  static const onSecondary = Color(0xFFF2F2F2);
  static const surface = Color(0xFFEBF4FA);
  static const onSurface = Color(0xFF196092);
  static const background = Color(0xFFF2F2F2);
  static const onBackground = Color(0xFF196092);
  static const error = Color(0xFFEA747A);
  static const onError = Color(0xFFF2F2F2);

}

class DarkColors {

  static const colorDark = Color(0xFF121212);
  static const primary = Color(0xFFF2F2F2);
  static const onPrimary = Color(0xFF121212);
  static const secondary = Color(0xFFF2F2F2);
  static const onSecondary = Color(0xFF0377A7);
  static const surface = Color(0xFF182A3A);
  static const onSurface = Color(0xFFF2F2F2);
  static const background = Color(0xFF121212);
  static const onBackground = Color(0xFFF2F2F2);
  static const error = Color(0xFFEA747A);
  static const onError = Color(0xFFF2F2F2);

}

class LevelColors {

  static const green = Color(0xFF6FC97F);
  static const yellow = Color(0xFFF1DB51);
  static const orange = Color(0xFFF4A460);
  static const orangeDark = Color(0xFFFB8C00);
  static const redLight = Color(0xFFFF7043);
  static const red = Color(0xFFE53935);

}

final Map mapColor = {
  'Neutro': LightColors.secondary,
  'Verde' : LevelColors.green,
  'Amarillo' : LevelColors.yellow,
  'Naranja Claro' : LevelColors.orange,
  'Naranja' : LevelColors.orangeDark,
  'Naranja Oscuro' : LevelColors.redLight,
  'Rojo' : LevelColors.red
};

const colorSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: LightColors.primary,
  onPrimary: LightColors.onPrimary,
  secondary: LightColors.secondary,
  onSecondary: LightColors.onSecondary,
  surface: LightColors.surface,
  onSurface: LightColors.onSurface,
  error: LightColors.error,
  onError: LightColors.onError,
);

const colorSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: DarkColors.primary,
  onPrimary: DarkColors.onPrimary,
  secondary: DarkColors.secondary,
  onSecondary: DarkColors.onSecondary,
  surface: DarkColors.surface,
  onSurface: DarkColors.onSurface,
  error: DarkColors.error,
  onError: DarkColors.onError,
);

extension ColorShade on Color {
  Color shade([double factor = 0.2]) {
    assert(factor >= 0 && factor <= 1, 'Factor must be between 0 and 1');
    final hslColor = HSLColor.fromColor(this);
    final lightness = (factor < 0.5)
        ? hslColor.lightness * factor
        : hslColor.lightness + (1 - hslColor.lightness) * (factor - 0.5);
    return hslColor.withLightness(lightness).toColor();
  }
}