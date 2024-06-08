// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_presion_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValorPresionRequestModel _$ValorPresionRequestModelFromJson(
        Map<String, dynamic> json) =>
    ValorPresionRequestModel(
      idPaciente: json['id_paciente'] as String,
      valorSistolica: (json['valor_sistolica'] as num).toInt(),
      valorDiastolica: (json['valor_diastolica'] as num).toInt(),
      medicion: json['medicion'] as String,
      notas: json['notas'] as String,
    );

Map<String, dynamic> _$ValorPresionRequestModelToJson(
        ValorPresionRequestModel instance) =>
    <String, dynamic>{
      'id_paciente': instance.idPaciente,
      'valor_sistolica': instance.valorSistolica,
      'valor_diastolica': instance.valorDiastolica,
      'medicion': instance.medicion,
      'notas': instance.notas,
    };
