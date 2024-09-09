import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/direccion/presentation/widgets/text_field_custom.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/option_widget.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/template_quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SensacionQuestion extends StatefulWidget {
  final String question;
  final List<String> additionalOptions;
  final ValueChanged<String> onOptionSelected;
  final ValueChanged<String> onAdditionalOptionSelected;
  final String? selectedOption;
  final String? selectedAdditionalOption;
  final TextEditingController otroController;
  final ValueChanged<String>? onChanged;
  final Color? backgroundColor;

  const SensacionQuestion({
    super.key,
    required this.question,
    required this.additionalOptions,
    required this.onOptionSelected,
    required this.onAdditionalOptionSelected,
    this.selectedOption,
    this.selectedAdditionalOption,
    required this.otroController,
    this.onChanged,
    this.backgroundColor,
  });

  @override
  State<SensacionQuestion> createState() => _SensacionQuestionState();
}

class _SensacionQuestionState extends State<SensacionQuestion> with AutomaticKeepAliveClientMixin<SensacionQuestion> {

  String? _selectedOption;
  String? _selectedAdditionalOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
    _selectedAdditionalOption = widget.selectedAdditionalOption;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
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
                _selectedAdditionalOption = null;
                widget.otroController.clear();
                widget.onOptionSelected(_selectedOption!);
              });
            },
            textColor: isDarkMode ? colorScheme.primary : colorScheme.secondary,
            selectedTextColor: isDarkMode ? colorScheme.primary: colorScheme.onPrimary,
            selectedResponseColor: isDarkMode ? colorScheme.onSecondary : colorScheme.secondary,
          ),
          OptionWidget(
            respuesta: 'No',
            index: 1,
            backgroundColor: widget.backgroundColor,
            selectedResponse: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = 'No';
                _selectedAdditionalOption = null;
                widget.otroController.clear();
                widget.onOptionSelected(_selectedOption!);
              });
            },
            textColor: isDarkMode ? colorScheme.primary : colorScheme.secondary,
            selectedTextColor: isDarkMode ? colorScheme.primary: colorScheme.onPrimary,
            selectedResponseColor: isDarkMode ? colorScheme.onSecondary : colorScheme.secondary,
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
                            widget.otroController.clear();
                            FocusScope.of(context).unfocus();
                            widget.onAdditionalOptionSelected(_selectedAdditionalOption!);
                          });
                        },
                        textColor: isDarkMode ? colorScheme.primary : colorScheme.secondary,
                        selectedTextColor: isDarkMode ? colorScheme.primary: colorScheme.onPrimary,
                        selectedResponseColor: isDarkMode ? colorScheme.onSecondary : colorScheme.secondary,
                      );
                    }),
                  ],
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.01),
                TextFieldCustom(
                  controller: widget.otroController,
                  hintText: 'Otro',
                  labelText: 'Otro',
                  onFocus: () {
                    setState(() {
                      _selectedAdditionalOption = '';
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = 'Sí';
                      _selectedAdditionalOption = '';
                      widget.onAdditionalOptionSelected(value);
                      if (widget.onChanged != null) {
                        widget.onChanged!(value);
                      }
                    });
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                    LengthLimitingTextInputFormatter(30),
                  ],
                  typeKeyboard: TextInputType.text,
                  textColor: isDarkMode ? colorScheme.primary : colorScheme.secondary,
                  focusedTextColor: isDarkMode ? colorScheme.primary: colorScheme.onPrimary,

                  focusedBackgroundColor: isDarkMode ? colorScheme.onSecondary : colorScheme.secondary,
                  focusedBorderColor: isDarkMode ? colorScheme.onSecondary : colorScheme.secondary,
                  focusedHintColor: isDarkMode ? colorScheme.primary: colorScheme.onPrimary,
                  focusedCursorColor: isDarkMode ? colorScheme.primary: colorScheme.onPrimary,

                  backgroundColor: isDarkMode ? colorScheme.primary : colorScheme.onPrimary,
                  enabledBorderColor: isDarkMode ? colorScheme.onSecondary : colorScheme.secondary,
                  hintColor: isDarkMode ? colorScheme.primary : colorScheme.secondary,
                  cursorColor: isDarkMode ? colorScheme.primary : colorScheme.secondary,
                )
              ],
            ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}