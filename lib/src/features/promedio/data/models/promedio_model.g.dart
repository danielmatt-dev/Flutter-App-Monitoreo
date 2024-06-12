// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promedio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromedioModel _$PromedioModelFromJson(Map<String, dynamic> json) =>
    PromedioModel(
      titulo: json['titulo'] as String,
      promedio: (json['promedio'] as num).toDouble(),
      color: json['color'] as String,
      valorMinimo: (json['valor_minimo'] as num).toDouble(),
      valorMaximo: (json['valor_maximo'] as num).toDouble(),
    );

Map<String, dynamic> _$PromedioModelToJson(PromedioModel instance) =>
    <String, dynamic>{
      'titulo': instance.titulo,
      'promedio': instance.promedio,
      'color': instance.color,
      'valor_minimo': instance.valorMinimo,
      'valor_maximo': instance.valorMaximo,
    };
