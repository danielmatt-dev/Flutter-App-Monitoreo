// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacientePasswordModel _$PacientePasswordModelFromJson(
        Map<String, dynamic> json) =>
    PacientePasswordModel(
      idPaciente: json['id_paciente'] as String,
      hashActual: json['hash_actual'] as String,
      hashNuevo: json['hash_nuevo'] as String,
    );

Map<String, dynamic> _$PacientePasswordModelToJson(
        PacientePasswordModel instance) =>
    <String, dynamic>{
      'id_paciente': instance.idPaciente,
      'hash_actual': instance.hashActual,
      'hash_nuevo': instance.hashNuevo,
    };
