// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_presion_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValorPresionResponseModel _$ValorPresionResponseModelFromJson(
        Map<String, dynamic> json) =>
    ValorPresionResponseModel(
      folio: (json['folio'] as num).toInt(),
      fecha: json['fecha'] as String,
      hora: json['hora'] as String,
      valorSistolica: (json['valor_sistolica'] as num).toInt(),
      valorDiastolica: (json['valor_diastolica'] as num).toInt(),
      color: json['color'] as String,
      medicion: json['medicion'] as String,
      notas: json['notas'] as String,
    );

Map<String, dynamic> _$ValorPresionResponseModelToJson(
        ValorPresionResponseModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'fecha': instance.fecha,
      'hora': instance.hora,
      'valor_sistolica': instance.valorSistolica,
      'valor_diastolica': instance.valorDiastolica,
      'color': instance.color,
      'medicion': instance.medicion,
      'notas': instance.notas,
    };
