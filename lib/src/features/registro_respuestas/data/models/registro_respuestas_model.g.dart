// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_respuestas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistroRequestModel _$RegistroRequestModelFromJson(
        Map<String, dynamic> json) =>
    RegistroRequestModel(
      fcmToken: json['fcm_token'] as String,
      respuestas: (json['respuestas'] as List<dynamic>)
          .map((e) =>
              RegistroRespuestasModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegistroRequestModelToJson(
        RegistroRequestModel instance) =>
    <String, dynamic>{
      'fcm_token': instance.fcmToken,
      'respuestas': instance.respuestas,
    };

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
