// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_presion_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValorPresionRequestModel _$ValorPresionRequestModelFromJson(
        Map<String, dynamic> json) =>
    ValorPresionRequestModel(
      valorSistolica: (json['valor_sistolica'] as num).toInt(),
      valorDiastolica: (json['valor_diastolica'] as num).toInt(),
      medicion: json['medicion'] as String,
      notas: json['notas'] as String,
    )..folio = (json['folio'] as num).toInt();

Map<String, dynamic> _$ValorPresionRequestModelToJson(ValorPresionRequestModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'medicion': instance.medicion,
      'notas': instance.notas,
      'valor_sistolica': instance.valorSistolica,
      'valor_diastolica': instance.valorDiastolica,
    };
