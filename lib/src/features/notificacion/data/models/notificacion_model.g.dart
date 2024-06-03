// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificacionModel _$NotificacionModelFromJson(Map<String, dynamic> json) =>
    NotificacionModel(
      idNotificacion: (json['id_notificacion'] as num).toInt(),
      titulo: json['titulo'] as String,
      descripcion: json['descripcion'] as String,
      tipo: json['tipo'] as String,
    );

Map<String, dynamic> _$NotificacionModelToJson(NotificacionModel instance) =>
    <String, dynamic>{
      'id_notificacion': instance.idNotificacion,
      'titulo': instance.titulo,
      'descripcion': instance.descripcion,
      'tipo': instance.tipo,
    };
