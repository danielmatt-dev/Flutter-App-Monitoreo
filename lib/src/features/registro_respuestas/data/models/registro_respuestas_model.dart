import 'package:json_annotation/json_annotation.dart';

part 'registro_respuestas_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegistroRespuestasModel {

  late int folio;
  final int idPregunta;
  final String descripcionPregunta;
  final String tipo;
  final String respuesta;
  final int puntaje;

  RegistroRespuestasModel({
    required this.idPregunta,
    required this.descripcionPregunta,
    required this.tipo,
    required this.respuesta,
    required this.puntaje
  });

  factory RegistroRespuestasModel.fromJson(Map<String, dynamic> json) => _$RegistroRespuestasModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistroRespuestasModelToJson(this);

}

// <>