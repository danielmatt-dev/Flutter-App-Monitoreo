// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respuesta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RespuestaModel _$RespuestaModelFromJson(Map<String, dynamic> json) =>
    RespuestaModel(
      idRespuesta: (json['id_respuesta'] as num).toInt(),
      descripcion: json['descripcion'] as String,
      puntaje: (json['puntaje'] as num).toInt(),
    );

Map<String, dynamic> _$RespuestaModelToJson(RespuestaModel instance) =>
    <String, dynamic>{
      'id_respuesta': instance.idRespuesta,
      'descripcion': instance.descripcion,
      'puntaje': instance.puntaje,
    };
