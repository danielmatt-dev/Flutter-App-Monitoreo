// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacion_personal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificacionPersonalModel _$NotificacionPersonalModelFromJson(
        Map<String, dynamic> json) =>
    NotificacionPersonalModel(
      folio: (json['folio'] as num).toInt(),
      titulo: json['titulo'] as String,
      descripcion: json['descripcion'] as String,
      tipo: json['tipo'] as String,
    );

Map<String, dynamic> _$NotificacionPersonalModelToJson(
        NotificacionPersonalModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'titulo': instance.titulo,
      'descripcion': instance.descripcion,
      'tipo': instance.tipo,
    };
