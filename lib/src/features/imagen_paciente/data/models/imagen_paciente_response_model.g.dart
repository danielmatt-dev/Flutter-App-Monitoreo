// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagen_paciente_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagenPacienteResponseModel _$ImagenPacienteResponseModelFromJson(
        Map<String, dynamic> json) =>
    ImagenPacienteResponseModel(
      url: json['url'] as String,
      tipoImagen: json['tipo_imagen'] as String,
      fecha: json['fecha'] as String,
      hora: json['hora'] as String,
    )..folio = (json['folio'] as num).toInt();

Map<String, dynamic> _$ImagenPacienteResponseModelToJson(
        ImagenPacienteResponseModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'tipo_imagen': instance.tipoImagen,
      'fecha': instance.fecha,
      'hora': instance.hora,
      'folio': instance.folio,
    };
