// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direccion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DireccionModel _$DireccionModelFromJson(Map<String, dynamic> json) =>
    DireccionModel(
      folio: (json['folio'] as num).toInt(),
      colonia: json['colonia'] as String,
      codigoPostal: json['codigo_postal'] as String,
      ciudad: json['ciudad'] as String,
      estado: json['estado'] as String,
      pais: json['pais'] as String,
    );

Map<String, dynamic> _$DireccionModelToJson(DireccionModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'colonia': instance.colonia,
      'codigo_postal': instance.codigoPostal,
      'ciudad': instance.ciudad,
      'estado': instance.estado,
      'pais': instance.pais,
    };
