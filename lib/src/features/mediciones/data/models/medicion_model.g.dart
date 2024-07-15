// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicionModel _$MedicionModelFromJson(Map<String, dynamic> json) =>
    MedicionModel(
      folio: (json['folio'] as num).toInt(),
      medicion: json['medicion'] as String,
      fecha: DateTime.parse(json['fecha'] as String),
      tipoMedicion: json['tipo_medicion'] as String,
    );

Map<String, dynamic> _$MedicionModelToJson(MedicionModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'medicion': instance.medicion,
      'fecha': instance.fecha.toIso8601String(),
      'tipo_medicion': instance.tipoMedicion,
    };
