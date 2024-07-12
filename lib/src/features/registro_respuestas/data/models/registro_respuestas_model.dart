import 'package:json_annotation/json_annotation.dart';

part 'registro_respuestas_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegistroRequestModel {

  final String fcmToken;
  final List<RegistroRespuestasModel> respuestas;

  RegistroRequestModel({
    required this.fcmToken,
    required this.respuestas
  });

  factory RegistroRequestModel.fromJson(Map<String, dynamic> json) => _$RegistroRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistroRequestModelToJson(this);

}

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