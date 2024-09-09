// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_respuestas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistroRespuestasModel _$RegistroRespuestasModelFromJson(
        Map<String, dynamic> json) =>
    RegistroRespuestasModel(
      idPregunta: (json['id_pregunta'] as num).toInt(),
      descripcionPregunta: json['descripcion_pregunta'] as String,
      tipo: json['tipo'] as String,
      respuesta: json['respuesta'] as String,
      puntaje: (json['puntaje'] as num).toInt(),
    )..folio = (json['folio'] as num).toInt();

Map<String, dynamic> _$RegistroRespuestasModelToJson(
        RegistroRespuestasModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'id_pregunta': instance.idPregunta,
      'descripcion_pregunta': instance.descripcionPregunta,
      'tipo': instance.tipo,
      'respuesta': instance.respuesta,
      'puntaje': instance.puntaje,
    };
