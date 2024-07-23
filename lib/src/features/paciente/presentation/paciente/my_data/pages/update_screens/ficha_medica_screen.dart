import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/signup_screens.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/template_appbar.dart';
import 'package:flutter/material.dart';

class FichaMedicaScreen extends StatelessWidget {

  const FichaMedicaScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return TemplateAppBar(
        title: 'Ficha Médica',
        child: Column(
          children: [
            TemplateQuestion(
              question: 'Tipo de diabetes',
              answers: tipoOpciones,
              onSelectedResponse: (value) {},
            ),
            TemplateQuestion(
              question: 'Tiempo con diabetes',
              answers: tiempoOpciones,
              onSelectedResponse: (value) {},
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.015),
          ],
        ),
      );
  }
}