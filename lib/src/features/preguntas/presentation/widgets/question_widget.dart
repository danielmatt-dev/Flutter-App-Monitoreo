import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {

  final Pregunta pregunta;
  final int sizePreguntas;
  final ValueChanged<int> onSelectedResponse;
  final int? selectedResponse;

  const QuestionWidget({
    super.key,
    required this.pregunta,
    required this.sizePreguntas,
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
          AppTextStyles.autoBodyStyle(
              text: 'Pregunta ${pregunta.idPregunta}/$sizePreguntas',
              color: colorScheme.secondary,
              height: height,
              percent: 0.025,
          ),
          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.015),
          const LinearProgressIndicator(
            value: 1 / 32,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              pregunta.pregunta,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colorScheme.secondary),
              textAlign: TextAlign.center,
            ),
          ),
          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
          ...pregunta.respuestas.map((respuesta) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: selectedResponse == respuesta.idRespuesta
                    ? colorScheme.secondary
                    : colorScheme.background,
                border: Border.all(color: colorScheme.secondary),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: RadioListTile<int>(
                value: respuesta.idRespuesta,
                groupValue: selectedResponse,
                onChanged: (value) {
                  onSelectedResponse(value!);
                },
                title: Text(
                  respuesta.descripcion,
                  style: TextStyle(
                    color: selectedResponse == respuesta.idRespuesta
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