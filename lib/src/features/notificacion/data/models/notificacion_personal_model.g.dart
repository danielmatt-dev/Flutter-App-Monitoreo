// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacion_personal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificacionPersonalModel _$NotificacionPersonalModelFromJson(
        Map<String, dynamic> json) =>
    NotificacionPersonalModel(
      idNotificacion: (json['id_notificacion'] as num).toInt(),
      idPaciente: json['id_paciente'] as String,
      titulo: json['titulo'] as String,
      descripcion: json['descripcion'] as String,
      tipo: json['tipo'] as String,
    );

Map<String, dynamic> _$NotificacionPersonalModelToJson(
        NotificacionPersonalModel instance) =>
    <String, dynamic>{
      'id_notificacion': instance.idNotificacion,
      'id_paciente': instance.idPaciente,
      'titulo': instance.titulo,
      'descripcion': instance.descripcion,
      'tipo': instance.tipo,
    };
