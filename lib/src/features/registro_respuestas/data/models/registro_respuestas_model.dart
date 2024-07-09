import 'package:json_annotation/json_annotation.dart';

part 'registro_respuestas_model.g.dart';

@JsonSerializable()
class RegistroRespuestasModel {

  final int folio;
  final int idPregunta;
  final String descripcionPregunta;
  final String respuesta;
  final int puntaje;

  RegistroRespuestasModel({
    required this.folio,
    required this.idPregunta,
    required this.descripcionPregunta,
    required this.respuesta,
    required this.puntaje
  });

  factory RegistroRespuestasModel.fromJson(Map<String, dynamic> json) => _$RegistroRespuestasModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistroRespuestasModelToJson(this);

}

// <>