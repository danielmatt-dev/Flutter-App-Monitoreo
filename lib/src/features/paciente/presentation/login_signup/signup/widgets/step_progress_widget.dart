import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StepProgressWidget extends StatelessWidget {

  final int currentStep;
  final int totalSteps;
  final List<String> titles;

  const StepProgressWidget({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.titles
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Container(
      //height: height*0.15,
      decoration:  BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.primary.withOpacity(0.2), width: 1.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: CircularPercentIndicator(
                  radius: 35.0,
                  lineWidth: 5.0,
                  percent: currentStep + 1 / totalSteps,
                  center: AppTextStyles.autoBodyStyle(
                      text: '${currentStep + 1}/$totalSteps',
                      color: colorScheme.secondary,
                      height: height
                  ),
                  progressColor: colorScheme.secondary,
                  backgroundColor: Colors.grey.shade300,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppTextStyles.autoTitleStyle(
                      text: titles[currentStep],
                      color: colorScheme.secondary,
                      height: height
                  ),
                  AppTextStyles.autoBodyStyle(
                      text: 'Siguiente: ${titles[currentStep]}',
                      color: colorScheme.secondary,
                      height: height
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}