import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class Promedio {

  final String medicion;
  final double promedio;
  final String medida;
  final String color;
  final double valorMinimo;
  final double valorMaximo;

  const Promedio({
    required this.medicion,
    required this.promedio,
    required this.medida,
    required this.color,
    required this.valorMinimo,
    required this.valorMaximo,
  });

  double calcularPorcentaje() {
    double clampedPromedio = promedio.clamp(valorMinimo, valorMaximo);
    return (clampedPromedio - valorMinimo) / (valorMaximo - valorMinimo);
  }

  Color buscarColor() => mapColor[color];

}