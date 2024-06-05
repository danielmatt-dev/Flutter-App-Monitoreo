// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_glucosa_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValorGlucosaRequestModel _$ValorGlucosaRequestModelFromJson(
        Map<String, dynamic> json) =>
    ValorGlucosaRequestModel(
      idPaciente: json['id_paciente'] as String,
      valor: (json['valor'] as num).toInt(),
      medicion: json['medicion'] as String,
      notas: json['notas'] as String,
    );

Map<String, dynamic> _$ValorGlucosaRequestModelToJson(
        ValorGlucosaRequestModel instance) =>
    <String, dynamic>{
      'id_paciente': instance.idPaciente,
      'valor': instance.valor,
      'medicion': instance.medicion,
      'notas': instance.notas,
    };
