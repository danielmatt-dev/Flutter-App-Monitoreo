import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/option_widget.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/template_quiz.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/shared/widgets/dropdown_button_custom.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// <>
class QuestionsSomatometriaScreen extends StatefulWidget {

  const QuestionsSomatometriaScreen({super.key});

  @override
  State<QuestionsSomatometriaScreen> createState() => _QuestionsSomatometriaScreenState();
}

class _QuestionsSomatometriaScreenState extends State<QuestionsSomatometriaScreen> {

  final PageController _pageController = PageController();
  final Map<int, RegistroRespuestas> answers = {};

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: somatometriaPreguntas.length,
              itemBuilder: (context, index) {
                final pregunta = somatometriaPreguntas[index];
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConditionalOptionWidget(
                    question: '¿Consideras que tu visión es adecuada?',
                    additionalOptions: ['Opción 1', 'Opción 2', 'Opción 3', 'Opción 1', 'Opción 2'],
                    onOptionSelected: (option) {
                      print('Opción seleccionada: $option');
                    },
                    onAdditionalOptionSelected: (additionalOption) {
                      print('Opción adicional seleccionada: $additionalOption');
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SensacionQuestion extends StatelessWidget {

  final Pregunta pregunta;
  final String? selectedResponse;
  final ValueChanged<int> onSelectedResponse;
  final Color? backgroundColor;

  const SensacionQuestion({
    super.key,
    required this.pregunta,
    this.selectedResponse,
    required this.onSelectedResponse,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return TemplateQuiz(
      question: pregunta.pregunta,
      children: [
        ...pregunta.respuestas.asMap().entries.toList().reversed.map((entry) {
          return OptionWidget(
              respuesta: entry.value.descripcion,
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

class VisionQuestion extends StatelessWidget {

  final Pregunta pregunta;
  final String? selectedResponse;
  final ValueChanged<int> onSelectedResponse;
  final Color? backgroundColor;

  const VisionQuestion({
    super.key,
    required this.pregunta,
    this.selectedResponse,
    required this.onSelectedResponse,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return TemplateQuiz(
        question: pregunta.pregunta,
        children: [
          ...pregunta.respuestas.asMap().entries.toList().reversed.map((entry) {
            return OptionWidget(
                respuesta: entry.value.descripcion,
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

// <>
class TratamientoQuestion extends StatelessWidget {

  final Map<String, List<String>> tratamientos;
  final String? selectedResponse;
  final Color? backgroundColor;
  final ValueChanged<String?> onChanged;

  const TratamientoQuestion({
    super.key,
    required this.tratamientos,
    this.selectedResponse,
    this.backgroundColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return TemplateQuiz(
      question: 'Seleccione su tratamiento',
      children: [
        ...tratamientos.entries.toList().map((tratamiento) {
          return CustomDropdownButton(
            items: tratamiento.value,
            selectedValue: selectedResponse,
            label: tratamiento.key,
            heightList: height * 0.5,
            heightButton: height * 0.08,
            onChanged: onChanged,
          );
        })
      ],
    );
  }

}

class ConditionalOptionWidget extends StatefulWidget {

  final String question;
  final List<String> additionalOptions;
  final ValueChanged<String> onOptionSelected;
  final ValueChanged<String> onAdditionalOptionSelected;
  final String? selectedOption;
  final String? selectedAdditionalOption;
  final Color? backgroundColor;

  const ConditionalOptionWidget({
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
  State<ConditionalOptionWidget> createState() => _ConditionalOptionWidgetState();
}

class _ConditionalOptionWidgetState extends State<ConditionalOptionWidget> {

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

    return TemplateQuiz(
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
                  FastTextFieldCustom(
                    backgroundColor: colorScheme.background,
                    controller: controller,
                    hintText: 'Otro',
                    labelText: '',
                    borderColor: colorScheme.secondary,
                    hintOpacity: 1,
                    hintColor: colorScheme.secondary,
                    sizePorcent: 0.75,
                  )
                ]
            )
        ]
    );
  }
}