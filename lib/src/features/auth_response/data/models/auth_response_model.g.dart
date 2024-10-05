// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      idPaciente: json['id'] as String,
      usuario: json['usuario'] as String,
      correo: json['correo'] as String,
      token: json['token'] as String,
      fechaExpiracion: DateTime.parse(json['fecha_expiracion'] as String),
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'id': instance.idPaciente,
      'usuario': instance.usuario,
      'correo': instance.correo,
      'token': instance.token,
      'fecha_expiracion': instance.fechaExpiracion.toIso8601String(),
    };
