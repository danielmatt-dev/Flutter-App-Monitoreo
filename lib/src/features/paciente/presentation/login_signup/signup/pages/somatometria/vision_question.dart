import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/option_widget.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/template_quiz.dart';
import 'package:flutter/material.dart';

// <>
class TemplateQuestion extends StatelessWidget {

  final String question;
  final List<String> answers;
  final String? selectedResponse;
  final ValueChanged<int> onSelectedResponse;
  final Color? backgroundColor;

  const TemplateQuestion({
    super.key,
    required this.question,
    required this.answers,
    this.selectedResponse,
    required this.onSelectedResponse,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return TemplateQuiz(
        question: question,
        children: [
          ...answers.asMap().entries.toList().reversed.map((entry) {
            return OptionWidget(
                respuesta: entry.value,
                selectedResponse: selectedResponse,
                index: entry.key,
                backgroundColor: backgroundColor,
                onChanged: (value) {
                  onSelectedResponse(value!);
                });
          }),
        ]
    );
  }

}
