// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagen_paciente_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagenPacienteRequestModel _$ImagenPacienteRequestModelFromJson(
        Map<String, dynamic> json) =>
    ImagenPacienteRequestModel(
      tipoImagen: json['tipo_imagen'] as String,
      imagen: json['imagen'] as String,
      fecha: json['fecha'] as String,
      hora: json['hora'] as String,
    )..folio = (json['folio'] as num).toInt();

Map<String, dynamic> _$ImagenPacienteRequestModelToJson(
        ImagenPacienteRequestModel instance) =>
    <String, dynamic>{
      'tipo_imagen': instance.tipoImagen,
      'imagen': instance.imagen,
      'fecha': instance.fecha,
      'hora': instance.hora,
      'folio': instance.folio,
    };
