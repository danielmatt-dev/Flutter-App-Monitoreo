// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      idPaciente: json['id'] as String,
      token: json['token'] as String,
      fechaExpiracion: DateTime.parse(json['fecha_expiracion'] as String),
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'id': instance.idPaciente,
      'token': instance.token,
      'fecha_expiracion': instance.fechaExpiracion.toIso8601String(),
    };
