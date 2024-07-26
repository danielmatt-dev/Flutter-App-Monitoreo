import 'package:app_plataforma/src/features/preguntas/presentation/widgets/template_quiz.dart';
import 'package:app_plataforma/src/shared/widgets/dropdown_button_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TratamientoQuestion extends StatefulWidget {

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
  State<TratamientoQuestion> createState() => _TratamientoQuestionState();
}

class _TratamientoQuestionState extends State<TratamientoQuestion> with AutomaticKeepAliveClientMixin<TratamientoQuestion> {

  @override
  Widget build(BuildContext context) {

    super.build(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TemplateQuiz(
          question: widget.question,
          children: [
            ...widget.tratamientos.entries.toList().map((tratamiento) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomDropdownButton(
                      items: tratamiento.value,
                      selectedValue: widget.selectedResponse,
                      label: tratamiento.key,
                      heightList: height * 0.5,
                      heightButton: height * 0.08,
                      width: width * 0.9,
                      onChanged: widget.onChanged,
                      ),
                    ),
                  ]
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}
