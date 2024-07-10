// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promedio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromedioModel _$PromedioModelFromJson(Map<String, dynamic> json) =>
    PromedioModel(
      medicion: json['medicion'] as String,
      promedio: (json['promedio'] as num).toInt(),
      medida: json['medida'] as String,
      color: json['color'] as String,
      valorMinimo: (json['valor_minimo'] as num).toInt(),
      valorMaximo: (json['valor_maximo'] as num).toInt(),
    );

Map<String, dynamic> _$PromedioModelToJson(PromedioModel instance) =>
    <String, dynamic>{
      'medicion': instance.medicion,
      'promedio': instance.promedio,
      'medida': instance.medida,
      'color': instance.color,
      'valor_minimo': instance.valorMinimo,
      'valor_maximo': instance.valorMaximo,
    };
