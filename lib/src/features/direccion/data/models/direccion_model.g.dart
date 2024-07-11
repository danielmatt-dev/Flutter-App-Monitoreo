// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direccion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DireccionModel _$DireccionModelFromJson(Map<String, dynamic> json) =>
    DireccionModel(
      id: (json['id'] as num).toInt(),
      colonia: json['colonia'] as String,
      codigoPostal: json['codigo_postal'] as String,
      asentamiento: json['asentamiento'] as String,
      calle: json['calle'] as String,
      numero: json['numero'] as String,
      entreCalleUno: json['entre_calle_uno'] as String,
      entreCalleDos: json['entre_calle_dos'] as String,
      ciudad: json['ciudad'] as String,
      estado: json['estado'] as String,
      pais: json['pais'] as String,
    );

Map<String, dynamic> _$DireccionModelToJson(DireccionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'colonia': instance.colonia,
      'codigo_postal': instance.codigoPostal,
      'asentamiento': instance.asentamiento,
      'calle': instance.calle,
      'numero': instance.numero,
      'entre_calle_uno': instance.entreCalleUno,
      'entre_calle_dos': instance.entreCalleDos,
      'ciudad': instance.ciudad,
      'estado': instance.estado,
      'pais': instance.pais,
    };
