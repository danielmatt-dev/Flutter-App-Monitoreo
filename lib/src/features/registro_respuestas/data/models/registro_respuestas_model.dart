import 'package:json_annotation/json_annotation.dart';

part 'registro_respuestas_model.g.dart';

@JsonSerializable()
class RegistroRespuestasModel {

  final int folio;
  final String idPregunta;
  final String descripcioPregunta;
  final String respuesta;
  final int puntaje;

  RegistroRespuestasModel({
    required this.folio,
    required this.idPregunta,
    required this.descripcioPregunta,
    required this.respuesta,
    required this.puntaje
  });

  factory RegistroRespuestasModel.fromJson(Map<String, dynamic> json) => _$RegistroRespuestasModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistroRespuestasModelToJson(this);

}

// <>