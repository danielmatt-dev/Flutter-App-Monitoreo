import 'package:app_plataforma/src/features/preguntas/domain/entities/respuesta.dart';

class Pregunta {

  final int idPregunta;
  final String pregunta;
  final List<Respuesta> respuestas;

  Pregunta({
    required this.idPregunta,
    required this.pregunta,
    required this.respuestas
  });

}

enum TipoPregunta {
  autocuidado,
  somatometria
}