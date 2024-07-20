import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/option_widget.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/template_quiz.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_custom.dart';
import 'package:flutter/material.dart';

class SensacionQuestion extends StatefulWidget {

  final String question;
  final List<String> additionalOptions;
  final ValueChanged<String> onOptionSelected;
  final ValueChanged<String> onAdditionalOptionSelected;
  final String? selectedOption;
  final String? selectedAdditionalOption;
  final Color? backgroundColor;

  const SensacionQuestion({
    super.key,
    required this.question,
    required this.additionalOptions,
    required this.onOptionSelected,
    required this.onAdditionalOptionSelected,
    this.selectedOption,
    this.selectedAdditionalOption,
    this.backgroundColor,
  });

  @override
  State<SensacionQuestion> createState() => _SensacionQuestionState();
}

class _SensacionQuestionState extends State<SensacionQuestion> {

  String? _selectedOption;
  String? _selectedAdditionalOption;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
    _selectedAdditionalOption = widget.selectedAdditionalOption;
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TemplateQuiz(
            question: widget.question,
            children: [
              OptionWidget(
                respuesta: 'Sí',
                index: 0,
                backgroundColor: widget.backgroundColor,
                selectedResponse: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = 'Sí';
                    widget.onOptionSelected(_selectedOption!);
                  });
                },
              ),
              OptionWidget(
                respuesta: 'No',
                index: 1,
                backgroundColor: widget.backgroundColor,
                selectedResponse: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = 'No';
                    widget.onOptionSelected(_selectedOption!);
                  });
                },
              ),
              if (_selectedOption == 'Sí')
                Column(
                    children: [
                      TemplateQuiz(
                          question: '¿Dónde?',
                          children: [
                            AppSizeBoxStyle.sizeBox(height: height),
                            ...widget.additionalOptions.map((option) {
                              return OptionWidget(
                                respuesta: option,
                                index: widget.additionalOptions.indexOf(option),
                                backgroundColor: widget.backgroundColor,
                                selectedResponse: _selectedAdditionalOption,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedAdditionalOption = option;
                                    widget.onAdditionalOptionSelected(_selectedAdditionalOption!);
                                  });
                                },
                              );
                            }),
                          ]
                      ),
                      FastTextFieldCustom(
                        backgroundColor: colorScheme.background,
                        controller: controller,
                        hintText: 'Otro',
                        labelText: '',
                        borderColor: colorScheme.secondary,
                        hintOpacity: 1,
                        hintColor: colorScheme.secondary,
                        sizePorcent: 0.075,
                      )
                    ]
                )
            ]
        ),
      ),
    );
  }
}
