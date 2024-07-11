// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_glucosa_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValorGlucosaRequestModel _$ValorGlucosaRequestModelFromJson(
        Map<String, dynamic> json) =>
    ValorGlucosaRequestModel(
      valor: (json['valor'] as num).toInt(),
      medicion: json['medicion'] as String,
      notas: json['notas'] as String,
    )..folio = (json['folio'] as num).toInt();

Map<String, dynamic> _$ValorGlucosaRequestModelToJson(
        ValorGlucosaRequestModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'medicion': instance.medicion,
      'notas': instance.notas,
      'valor': instance.valor,
    };
