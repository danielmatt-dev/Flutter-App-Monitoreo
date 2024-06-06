// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      idPaciente: json['id_paciente'] as String,
      token: json['token'] as String,
      fechaExpiracion: DateTime.parse(json['fechaExpiracion'] as String),
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'id_paciente': instance.idPaciente,
      'token': instance.token,
      'fechaExpiracion': instance.fechaExpiracion.toIso8601String(),
    };
