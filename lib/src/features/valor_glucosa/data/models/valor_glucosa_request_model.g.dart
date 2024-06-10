// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_glucosa_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValorGlucosaRequestModel _$ValorGlucosaRequestModelFromJson(
        Map<String, dynamic> json) =>
    ValorGlucosaRequestModel(
      folio: (json['folio'] as num).toInt(),
      valor: (json['valor'] as num).toInt(),
      medicion: json['medicion'] as String,
      notas: json['notas'] as String,
    );

Map<String, dynamic> _$ValorGlucosaRequestModelToJson(
        ValorGlucosaRequestModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'valor': instance.valor,
      'medicion': instance.medicion,
      'notas': instance.notas,
    };
