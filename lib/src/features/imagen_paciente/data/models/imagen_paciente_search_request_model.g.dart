// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagen_paciente_search_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagenPacienteSearchRequestModel _$ImagenPacienteSearchRequestModelFromJson(
        Map<String, dynamic> json) =>
    ImagenPacienteSearchRequestModel(
      tipoBusqueda: json['tipo_busqueda'] as String,
      regionCuerpo: json['region_cuerpo'] as String?,
      fechaInicio: json['fecha_inicio'] as String?,
      fechaFin: json['fecha_fin'] as String?,
    )..folio = (json['folio'] as num).toInt();

Map<String, dynamic> _$ImagenPacienteSearchRequestModelToJson(
        ImagenPacienteSearchRequestModel instance) =>
    <String, dynamic>{
      'tipo_busqueda': instance.tipoBusqueda,
      'region_cuerpo': instance.regionCuerpo,
      'fecha_inicio': instance.fechaInicio,
      'fecha_fin': instance.fechaFin,
      'folio': instance.folio,
    };
