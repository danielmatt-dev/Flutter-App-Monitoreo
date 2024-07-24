import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/signup_screens.dart';
import 'package:flutter/material.dart';

class FichaMedicaSection extends StatefulWidget {

  final TextEditingController tipoController;
  final TextEditingController tiempoController;

  const FichaMedicaSection({
    super.key,
    required this.tipoController,
    required this.tiempoController
  });

  @override
  State<FichaMedicaSection> createState() => _FichaMedicaSectionState();

}

class _FichaMedicaSectionState extends State<FichaMedicaSection> {

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        TemplateQuestion(
          question: 'Tipo de diabetes',
          answers: tipoOpciones,
          selectedResponse: widget.tipoController.text,
          onSelectedResponse: (value) {
            setState(() {
              widget.tipoController.text = tipoOpciones[value];
            });
          },
        ),
        TemplateQuestion(
          question: 'Tiempo con diabetes',
          answers: tiempoOpciones,
          selectedResponse: widget.tiempoController.text,
          onSelectedResponse: (value) {
            setState(() {
              widget.tiempoController.text = tiempoOpciones[value];
            });
          },
        ),
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.015),
      ],
    );
  }
}