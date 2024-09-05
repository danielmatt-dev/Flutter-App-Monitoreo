// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comentario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComentarioModel _$ComentarioModelFromJson(Map<String, dynamic> json) =>
    ComentarioModel(
      folio: (json['folio'] as num).toInt(),
      descripcion: json['descripcion'] as String,
    );

Map<String, dynamic> _$ComentarioModelToJson(ComentarioModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'descripcion': instance.descripcion,
    };
