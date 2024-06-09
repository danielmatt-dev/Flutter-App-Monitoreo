import 'package:json_annotation/json_annotation.dart';

part 'respuesta_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RespuestaModel {

  final int idRespuesta;
  final String descripcion;
  final int puntaje;

  RespuestaModel({
    required this.idRespuesta,
    required this.descripcion,
    required this.puntaje
  });

  factory RespuestaModel.fromJson(Map<String, dynamic> json) => _$RespuestaModelFromJson(json);

}

// <>