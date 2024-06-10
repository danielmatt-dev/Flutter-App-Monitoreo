// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_respuestas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistroRespuestasModel _$RegistroRespuestasModelFromJson(
        Map<String, dynamic> json) =>
    RegistroRespuestasModel(
      folio: (json['folio'] as num).toInt(),
      idPregunta: json['idPregunta'] as String,
      descripcionPregunta: json['descripcionPregunta'] as String,
      respuesta: json['respuesta'] as String,
      puntaje: (json['puntaje'] as num).toInt(),
    );

Map<String, dynamic> _$RegistroRespuestasModelToJson(
        RegistroRespuestasModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'idPregunta': instance.idPregunta,
      'descripcionPregunta': instance.descripcionPregunta,
      'respuesta': instance.respuesta,
      'puntaje': instance.puntaje,
    };
