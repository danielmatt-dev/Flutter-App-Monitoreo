import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/respuesta.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {

  final String question;
  final List<Respuesta> answers;
  final ValueChanged<int> onSelectedResponse;
  final String? selectedResponse;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.answers,
    required this.onSelectedResponse,
    this.selectedResponse,
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              question,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colorScheme.secondary),
              textAlign: TextAlign.center,
            ),
          ),
          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
          ...answers.asMap().entries.toList().reversed.map((entry) {
            final respuesta = entry.value;
            final respuestaIndex = entry.key;
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: selectedResponse == respuesta.descripcion
                    ? colorScheme.secondary
                    : colorScheme.background,
                border: Border.all(color: colorScheme.secondary),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: RadioListTile<int>(
                value: respuestaIndex,
                groupValue: selectedResponse == respuesta.descripcion ? respuestaIndex : null,
                onChanged: (value) {
                  onSelectedResponse(value!);
                },
                title: Text(
                  respuesta.descripcion,
                  style: TextStyle(
                    color: selectedResponse == respuesta.descripcion
                        ? colorScheme.background
                        : colorScheme.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
                activeColor: Colors.white,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            );
          }),
        ],
      ),
    );
  }
}