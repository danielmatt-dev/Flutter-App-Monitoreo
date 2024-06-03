import 'package:json_annotation/json_annotation.dart';

part 'notificacion_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NotificacionModel {

  @JsonKey(name: 'id_notificacion')
  final int idNotificacion;
  final String titulo;
  final String descripcion;
  final String tipo;

  NotificacionModel({
    required this.idNotificacion,
    required this.titulo,
    required this.descripcion,
    required this.tipo,
  });

  factory NotificacionModel.fromJson(Map<String, dynamic> json) => _$NotificacionModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificacionModelToJson(this);

}
