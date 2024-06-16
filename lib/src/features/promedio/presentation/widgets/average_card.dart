import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AverageCard extends StatelessWidget {

  final String titulo;
  final double porcentaje;
  final double promedio;
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

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: AppTextStyles.autoBodyStyle(
                text: titulo,
                color: colorScheme.primary,
                height: height,
                maxLines: 1,
                percent: 0.03,
              ),
            ),
            SizedBox(
              height: height * 0.18,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: CircularPercentIndicator(
                  radius: height * 0.15,
                  lineWidth: height * 0.015,
                  animation: true,
                  arcType: ArcType.HALF,
                  percent: porcentaje,
                  arcBackgroundColor: Colors.grey.withOpacity(0.3),
                  startAngle: 270,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: color,
                  center: Column(
                    children: [
                      AppSizeBoxStyle.sizeBox(
                          height: height,
                          percentage: 0.05
                      ),
                      AppTextStyles.autoBodyStyle(
                        text: '$promedio',
                        color: colorScheme.onBackground,
                        height: height,
                        maxLines: 1,
                        percent: 0.035,
                      ),
                      AppTextStyles.autoBodyStyle(
                        text: medida,
                        color: colorScheme.onBackground,
                        height: height,
                        maxLines: 1,
                        percent: 0.035,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: AppTextStyles.autoBodyStyle(
                      text: '$valorMinimo',
                      color: colorScheme.onBackground,
                      maxLines: 1,
                      height: height,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: AppTextStyles.autoBodyStyle(
                      text: '',
                      color: colorScheme.onBackground,
                      maxLines: 1,
                      height: height,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: AppTextStyles.autoBodyStyle(
                      text: '$valorMaximo',
                      color: colorScheme.primary,
                      maxLines: 1,
                      height: height,
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


  Widget buildCard({
    required ColorScheme colorScheme,
    required double height,
    required String titulo,
    required double porcentaje,
    required double promedio,
    required int valorMinimo,
    required int valorMaximo,
    required Color color
  }){
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: AppTextStyles.autoBodyStyle(
                text: titulo,
                color: colorScheme.primary,
                height: height,
                maxLines: 1,
                percent: 0.03,
              ),
            ),
            SizedBox(
              height: height * 0.18,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: CircularPercentIndicator(
                  radius: height * 0.15,
                  lineWidth: height * 0.015,
                  animation: true,
                  arcType: ArcType.HALF,
                  percent: porcentaje,
                  arcBackgroundColor: Colors.grey.withOpacity(0.3),
                  startAngle: 270,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: color,
                  center: Column(
                    children: [
                      AppSizeBoxStyle.sizeBox(height: height, percentage: 0.08),
                      AppTextStyles.autoBodyStyle(
                        text: '$promedio',
                        color: colorScheme.onBackground,
                        height: height,
                        maxLines: 1,
                        percent: 0.035,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: AppTextStyles.autoBodyStyle(
                      text: '$valorMinimo',
                      color: colorScheme.onBackground,
                      maxLines: 1,
                      height: height,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: AppTextStyles.autoBodyStyle(
                      text: '',
                      color: colorScheme.onBackground,
                      maxLines: 1,
                      height: height,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: AppTextStyles.autoBodyStyle(
                      text: '$valorMaximo',
                      color: colorScheme.primary,
                      maxLines: 1,
                      height: height,
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
