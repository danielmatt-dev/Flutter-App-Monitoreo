// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tratamiento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TratamientoModel _$TratamientoModelFromJson(Map<String, dynamic> json) =>
    TratamientoModel(
      idTratamiento: (json['idTratamiento'] as num).toInt(),
      nombre: json['nombre'] as String,
      tipo: json['tipo'] as String,
    );

Map<String, dynamic> _$TratamientoModelToJson(TratamientoModel instance) =>
    <String, dynamic>{
      'idTratamiento': instance.idTratamiento,
      'nombre': instance.nombre,
      'tipo': instance.tipo,
    };
