import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

// <>
class EasyStepCustom extends StatefulWidget {

  final List<EasyStep> steps;

  const EasyStepCustom({super.key, required this.steps});

  @override
  State<EasyStepCustom> createState() => _EasyStepCustomState();

}

class _EasyStepCustomState extends State<EasyStepCustom> {

  int activeStep = 0;

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: EasyStepper(
            activeStep: activeStep,
            stepShape: StepShape.circle,
            stepRadius: 15,
            showScrollbar: false,
            showLoadingAnimation: false,
            borderThickness: 2,
            internalPadding: 20,
            disableScroll: true,

            defaultStepBorderType: BorderType.normal,

            activeStepBackgroundColor: colorScheme.background,
            activeStepIconColor: colorScheme.onBackground,
            activeStepTextColor: colorScheme.onBackground,
            activeStepBorderColor: colorScheme.onBackground,

            unreachedStepBackgroundColor: colorScheme.background,
            unreachedStepIconColor: colorScheme.onBackground.withOpacity(0.2),
            unreachedStepTextColor: colorScheme.onBackground.withOpacity(0.2),
            unreachedStepBorderColor: colorScheme.onBackground.withOpacity(0.2),

            finishedStepBackgroundColor: colorScheme.onBackground,
            finishedStepIconColor: colorScheme.background,
            finishedStepTextColor: colorScheme.onBackground,
            finishedStepBorderColor: colorScheme.onBackground,

            lineStyle: LineStyle(
              //progress: 0.6,
              //progressColor: Colors.red,
              lineLength: 80,
              lineType: LineType.normal,
              lineThickness: 2,
              defaultLineColor: colorScheme.onBackground,
              unreachedLineColor: colorScheme.primary.withOpacity(0.2),
            ),
            steps: widget.steps,
            onStepReached: (index) {
              setState(() => activeStep = index);
            },
          ),
        ),
      ],
    );
  }
}
