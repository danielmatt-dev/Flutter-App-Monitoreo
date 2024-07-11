// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direccion_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DireccionResponseModel _$DireccionResponseModelFromJson(
        Map<String, dynamic> json) =>
    DireccionResponseModel(
      colonias: (json['colonias'] as List<dynamic>)
          .map((e) => ColoniaResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      codigoPostal: json['codigo_postal'] as String,
      ciudad: json['ciudad'] as String,
      estado: json['estado'] as String,
      pais: json['pais'] as String,
    );

Map<String, dynamic> _$DireccionResponseModelToJson(
        DireccionResponseModel instance) =>
    <String, dynamic>{
      'codigo_postal': instance.codigoPostal,
      'colonias': instance.colonias,
      'ciudad': instance.ciudad,
      'estado': instance.estado,
      'pais': instance.pais,
    };

ColoniaResponseModel _$ColoniaResponseModelFromJson(
        Map<String, dynamic> json) =>
    ColoniaResponseModel(
      nombre: json['nombre'] as String,
      tipo: json['tipo'] as String,
    );

Map<String, dynamic> _$ColoniaResponseModelToJson(
        ColoniaResponseModel instance) =>
    <String, dynamic>{
      'nombre': instance.nombre,
      'tipo': instance.tipo,
    };
