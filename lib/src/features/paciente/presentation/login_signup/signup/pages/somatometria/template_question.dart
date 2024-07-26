import 'package:app_plataforma/src/features/preguntas/presentation/widgets/option_widget.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/template_quiz.dart';
import 'package:flutter/material.dart';

// <>
class TemplateQuestion extends StatefulWidget {
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
    this.backgroundColor,
  });

  @override
  State<TemplateQuestion> createState() => _TemplateQuestionState();
}

class _TemplateQuestionState extends State<TemplateQuestion> {
  String? selectedResponse;

  @override
  void initState() {
    super.initState();
    selectedResponse = widget.selectedResponse;
  }

  void _onOptionSelected(int? index) {
    if (index != null) {
      setState(() {
        selectedResponse = widget.answers[index];
      });
      widget.onSelectedResponse(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
        child: TemplateQuiz(
          question: widget.question,
          children: widget.answers.asMap().entries.map((entry) {
            return OptionWidget(
              respuesta: entry.value,
              selectedResponse: selectedResponse,
              index: entry.key,
              backgroundColor: widget.backgroundColor,
              onChanged: _onOptionSelected,
            );
          }).toList(),
        ),
      ),
    );
  }
}
