import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ValorAverage {
  final String titulo;
  final double promedio;
  final String color;
  final double valorMinimo;
  final double valorMaximo;

  const ValorAverage({
    this.titulo = '',
    required this.promedio,
    required this.color,
    required this.valorMinimo,
    required this.valorMaximo,
  });

  double calcularPorcentaje() => (promedio-valorMinimo) / (valorMaximo-valorMinimo) * 100;

  Color buscarColor() => mapColor[color];

}