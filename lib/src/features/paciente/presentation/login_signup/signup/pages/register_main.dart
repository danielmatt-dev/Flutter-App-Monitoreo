import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/shared/widgets/easy_step_custom.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class MainRegister extends StatefulWidget {

  const MainRegister({super.key});

  @override
  State<MainRegister> createState() => _MainRegisterState();

}

class _MainRegisterState extends State<MainRegister> {

  int activeStep = 0;

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    final steps = [
      EasyStep(
          icon: const Icon(Icons.credit_card),
          customTitle: Column(
              children: [
                AppTextStyles.autoBodyStyle(
                    text: 'Usuario',
                    color: colorScheme.onBackground,
                    height: height,
                    textAlign: TextAlign.center,
                    percent: 0.02
                ),
              ]
          ),
          lineText: '',
          customLineWidget: Text('En progreso',
            style: AppTextStyles.bodyStyle(
                color: colorScheme.onBackground,
                size: height*0.015),
            textAlign: TextAlign.center,
          ),
          finishIcon: const Icon(Icons.check)
      ),
      EasyStep(
          icon: const Icon(Icons.credit_card),
          customTitle: Column(
              children: [
                AppTextStyles.autoBodyStyle(
                    text: 'Ficha Técnica',
                    color: colorScheme.onBackground,
                    height: height,
                    textAlign: TextAlign.center,
                    percent: 0.02
                ),
              ]
          ),
          lineText: '',
          customLineWidget: Text('Pendiente',
            style: AppTextStyles.bodyStyle(
                color: colorScheme.onBackground,
                size: height*0.015),
            textAlign: TextAlign.center,
          ),
          finishIcon: const Icon(Icons.check)
      ),
      EasyStep(
          icon: const Icon(Icons.credit_card),
          customTitle: Column(
              children: [
                AppTextStyles.autoBodyStyle(
                    text: 'Salud',
                    color: colorScheme.onBackground,
                    height: height,
                    textAlign: TextAlign.center,
                    percent: 0.02
                ),
              ]
          ),
          lineText: '',
          customLineWidget: Text('',
            style: AppTextStyles.bodyStyle(
                color: colorScheme.onBackground,
                size: height*0.015),
            textAlign: TextAlign.left,
          ),
          finishIcon: const Icon(Icons.check)
      ),
    ];

    return Scaffold(
      appBar: const AppBarCustom(
        title: 'Crear cuenta'
      ),
      body: EasyStepCustom(steps: steps,)
    );
  }
}