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

class _TratamientoQuestionState extends State<TratamientoQuestion> {

  String? _selectedOral;
  String? _selectedInsulina;

  @override
  void initState() {
    super.initState();

    if(widget.selectedResponse == null){
      return;
    }

    if (widget.tratamientos['Oral']?.contains(widget.selectedResponse) ?? false) {
      _selectedOral = widget.selectedResponse;
    }

    if (widget.tratamientos['Insulina']?.contains(widget.selectedResponse) ?? false) {
      _selectedInsulina = widget.selectedResponse;
    }

  }

  void _onChanged(String? newValue, String type) {
    setState(() {
      if (type == 'Oral') {
        _selectedOral = newValue;
        _selectedInsulina = null;
      } else if (type == 'Insulina') {
        _selectedInsulina = newValue;
        _selectedOral = null;
      }
    });
    widget.onChanged(newValue);
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TemplateQuiz(
          question: widget.question,
          children: [
            ...widget.tratamientos.entries.map((tratamiento) {
              final isOral = tratamiento.key == 'Oral';
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomDropdownButton(
                        items: tratamiento.value,
                        selectedValue: isOral ? _selectedOral : _selectedInsulina,
                        label: tratamiento.key,
                        heightList: height * 0.5,
                        heightButton: height * 0.08,
                        width: width * 0.9,
                        borderColor: colorScheme.secondary,
                        textColor: colorScheme.secondary,
                        onChanged: (value) => _onChanged(value, tratamiento.key),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

}
