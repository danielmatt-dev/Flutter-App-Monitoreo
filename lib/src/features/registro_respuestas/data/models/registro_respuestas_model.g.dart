// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_respuestas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistroRespuestasModel _$RegistroRespuestasModelFromJson(
        Map<String, dynamic> json) =>
    RegistroRespuestasModel(
      idPregunta: (json['idPregunta'] as num).toInt(),
      descripcionPregunta: json['descripcionPregunta'] as String,
      tipo: json['tipo'] as String,
      respuesta: json['respuesta'] as String,
      puntaje: (json['puntaje'] as num).toInt(),
    )..folio = (json['folio'] as num).toInt();

Map<String, dynamic> _$RegistroRespuestasModelToJson(
        RegistroRespuestasModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'idPregunta': instance.idPregunta,
      'descripcionPregunta': instance.descripcionPregunta,
      'tipo': instance.tipo,
      'respuesta': instance.respuesta,
      'puntaje': instance.puntaje,
    };
