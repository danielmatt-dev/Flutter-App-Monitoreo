import 'package:json_annotation/json_annotation.dart';

part 'notificacion_personal_model.g.dart';

// <>
@JsonSerializable(fieldRename: FieldRename.snake)
class NotificacionPersonalModel {

  final int folio;
  final String titulo;
  final String descripcion;
  final String tipo;

  NotificacionPersonalModel({
    required this.folio,
    required this.titulo,
    required this.descripcion,
    required this.tipo,
  });

  factory NotificacionPersonalModel.fromJson(Map<String, dynamic> json) => _$NotificacionPersonalModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificacionPersonalModelToJson(this);

}