import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/question_widget.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
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

    final brightness = Theme.of(context).brightness;

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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: QuestionWidget(
                    question: pregunta.pregunta,
                    answers: pregunta.respuestas,
                    selectedResponse: answers[pregunta.idPregunta]?.respuesta,
                    onSelectedResponse: (respuestaIndex) {
                      if (respuestaIndex < pregunta.respuestas.length) {
                        setState(() {
                          answers[pregunta.idPregunta] = RegistroRespuestas(
                            idPregunta: pregunta.idPregunta,
                            descripcionPregunta: pregunta.pregunta,
                            respuesta: pregunta.respuestas[respuestaIndex].descripcion,
                            puntaje: pregunta.respuestas[respuestaIndex].puntaje,
                            tipo: 'Test',
                          );
                        });
                      }
                    },
                    backgroundColor: brightness == Brightness.light
                        ? Colors.white
                        : Colors.black38,
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