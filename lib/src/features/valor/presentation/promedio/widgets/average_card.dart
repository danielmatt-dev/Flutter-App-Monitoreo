import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AverageCard extends StatelessWidget {

  final String titulo;
  final double porcentaje;
  final String promedio;
  final String medida;
  final int valorMinimo;
  final int valorMaximo;
  final Color color;

  const AverageCard({
    super.key,
    required this.titulo,
    required this.porcentaje,
    required this.promedio,
    required this.medida,
    required this.valorMinimo,
    required this.valorMaximo,
    required this.color
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: colorScheme.onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: AppTextStyles.autoBodyStyle(
                text: titulo,
                color: colorScheme.primary,
                size: SizeIcon.size22,
              ),
            ),
            SizedBox(
              height: 135,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: CircularPercentIndicator(
                  radius: 112,
                  lineWidth: 12,
                  animation: true,
                  arcType: ArcType.HALF,
                  percent: porcentaje,
                  arcBackgroundColor: Colors.grey.withOpacity(0.3),
                  startAngle: 270,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: color,
                  center: Column(
                    children: [
                      const SizedBox(height: 35),
                      AppTextStyles.autoBodyStyle(
                        text: promedio,
                        color: colorScheme.primary,
                        size: SizeIcon.size26,
                      ),
                      AppTextStyles.autoBodyStyle(
                        text: medida,
                        color: colorScheme.primary,
                        size: SizeIcon.size26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: AppTextStyles.autoBodyStyle(
                      text: '$valorMinimo',
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: AppTextStyles.autoBodyStyle(
                      text: '$valorMaximo',
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }

}
