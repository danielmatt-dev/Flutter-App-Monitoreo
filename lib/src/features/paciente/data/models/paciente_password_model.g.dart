// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacientePasswordModel _$PacientePasswordModelFromJson(
        Map<String, dynamic> json) =>
    PacientePasswordModel(
      currentPassword: json['current_password'] as String,
      newPassword: json['new_password'] as String,
    )..idPaciente = json['id'] as String;

Map<String, dynamic> _$PacientePasswordModelToJson(
        PacientePasswordModel instance) =>
    <String, dynamic>{
      'id': instance.idPaciente,
      'current_password': instance.currentPassword,
      'new_password': instance.newPassword,
    };
