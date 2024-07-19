import 'package:app_plataforma/src/features/preguntas/domain/entities/respuesta.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/option_widget.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/template_quiz.dart';
import 'package:flutter/material.dart';

class TestProfileWidget extends StatelessWidget {

  final String question;
  final List<Respuesta> answers;
  final ValueChanged<int> onSelectedResponse;
  final String? selectedResponse;
  final Color? backgroundColor;

  const TestProfileWidget({
    super.key,
    required this.question,
    required this.answers,
    required this.onSelectedResponse,
    this.selectedResponse,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: TemplateQuiz(
        question: question,
        children: [
          ...answers.asMap().entries.toList().reversed.map((entry) {
            return OptionWidget(
                respuesta: entry.value.descripcion,
                selectedResponse: selectedResponse,
                index: entry.key,
                backgroundColor: backgroundColor,
                onChanged: (value) {
                  onSelectedResponse(value!);
                });
          }),
        ],
      )
    );
  }
}