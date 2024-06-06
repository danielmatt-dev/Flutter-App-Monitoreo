// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregunta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreguntaModel _$PreguntaModelFromJson(Map<String, dynamic> json) =>
    PreguntaModel(
      idPregunta: (json['id_pregunta'] as num).toInt(),
      pregunta: json['pregunta'] as String,
      respuestas: (json['respuestas'] as List<dynamic>)
          .map((e) => RespuestaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PreguntaModelToJson(PreguntaModel instance) =>
    <String, dynamic>{
      'id_pregunta': instance.idPregunta,
      'pregunta': instance.pregunta,
      'respuestas': instance.respuestas,
    };
