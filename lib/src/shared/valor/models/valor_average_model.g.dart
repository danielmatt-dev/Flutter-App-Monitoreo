// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_average_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValorAverageModel _$ValorAverageModelFromJson(Map<String, dynamic> json) =>
    ValorAverageModel(
      titulo: json['titulo'] as String,
      promedio: (json['promedio'] as num).toDouble(),
      color: json['color'] as String,
      valorMinimo: (json['valor_minimo'] as num).toDouble(),
      valorMaximo: (json['valor_maximo'] as num).toDouble(),
    );

Map<String, dynamic> _$ValorAverageModelToJson(ValorAverageModel instance) =>
    <String, dynamic>{
      'titulo': instance.titulo,
      'promedio': instance.promedio,
      'color': instance.color,
      'valor_minimo': instance.valorMinimo,
      'valor_maximo': instance.valorMaximo,
    };
