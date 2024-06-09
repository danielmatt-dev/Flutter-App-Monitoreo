import 'package:app_plataforma/src/features/preguntas/data/models/respuesta_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pregunta_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PreguntaModel {

  final int idPregunta;
  final String pregunta;
  final List<RespuestaModel> respuestas;

  PreguntaModel({
    required this.idPregunta,
    required this.pregunta,
    required this.respuestas
  });

  factory PreguntaModel.fromJson(Map<String, dynamic> json) => _$PreguntaModelFromJson(json);

}

// <>