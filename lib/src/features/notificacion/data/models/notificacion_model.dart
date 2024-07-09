import 'package:json_annotation/json_annotation.dart';

part 'notificacion_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NotificacionModel {

  @JsonKey(name: 'id_notificacion')
  final int idNotificacion;
  final int folio;
  final String titulo;
  final String descripcion;
  final String tipo;
  final String prioridad;

  NotificacionModel({
    required this.idNotificacion,
    required this.folio,
    required this.titulo,
    required this.descripcion,
    required this.tipo,
    required this.prioridad
  });

  factory NotificacionModel.fromJson(Map<String, dynamic> json) => _$NotificacionModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificacionModelToJson(this);

}
