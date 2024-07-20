import 'package:app_plataforma/src/features/preguntas/presentation/widgets/template_quiz.dart';
import 'package:app_plataforma/src/shared/widgets/dropdown_button_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TratamientoQuestion extends StatelessWidget {

  final String question;
  final Map<String, List<String>> tratamientos;
  final String? selectedResponse;
  final Color? backgroundColor;
  final ValueChanged<String?> onChanged;

  const TratamientoQuestion({
    super.key,
    required this.question,
    required this.tratamientos,
    this.selectedResponse,
    this.backgroundColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TemplateQuiz(
          question: question,
          children: [
            ...tratamientos.entries.toList().map((tratamiento) {
              return Row(
                children: [
                  Expanded(
                    child: CustomDropdownButton(
                    items: tratamiento.value,
                    selectedValue: selectedResponse,
                    label: tratamiento.key,
                    heightList: height * 0.5,
                    heightButton: height * 0.08,
                    onChanged: onChanged,
                    ),
                  ),
                ]
              );
            })
          ],
        ),
      ),
    );
  }

}
