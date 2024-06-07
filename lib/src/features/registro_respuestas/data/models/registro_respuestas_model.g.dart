// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_respuestas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistroRespuestasModel _$RegistroRespuestasModelFromJson(
        Map<String, dynamic> json) =>
    RegistroRespuestasModel(
      idPaciente: json['idPaciente'] as String,
      idPregunta: json['idPregunta'] as String,
      descripcioPregunta: json['descripcioPregunta'] as String,
      respuesta: json['respuesta'] as String,
      puntaje: (json['puntaje'] as num).toInt(),
    );

Map<String, dynamic> _$RegistroRespuestasModelToJson(
        RegistroRespuestasModel instance) =>
    <String, dynamic>{
      'idPaciente': instance.idPaciente,
      'idPregunta': instance.idPregunta,
      'descripcioPregunta': instance.descripcioPregunta,
      'respuesta': instance.respuesta,
      'puntaje': instance.puntaje,
    };
