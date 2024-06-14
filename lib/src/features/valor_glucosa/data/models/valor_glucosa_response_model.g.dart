// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_glucosa_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValorGlucosaResponseModel _$ValorGlucosaResponseModelFromJson(
        Map<String, dynamic> json) =>
    ValorGlucosaResponseModel(
      folio: (json['folio'] as num).toInt(),
      fecha: json['fecha'] as String,
      hora: json['hora'] as String,
      valor: (json['valor'] as num).toInt(),
      color: json['color'] as String,
      medicion: json['medicion'] as String,
      notas: json['notas'] as String,
    );

Map<String, dynamic> _$ValorGlucosaResponseModelToJson(
        ValorGlucosaResponseModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'fecha': instance.fecha,
      'hora': instance.hora,
      'valor': instance.valor,
      'color': instance.color,
      'medicion': instance.medicion,
      'notas': instance.notas,
    };
