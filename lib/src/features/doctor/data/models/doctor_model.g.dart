// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      clave: json['clave'] as String,
      nombre: json['nombre'] as String,
      apellidoPaterno: json['apellido_paterno'] as String,
      apellidoMaterno: json['apellido_materno'] as String,
      fechaNacimiento: DateTime.parse(json['fecha_nacimiento'] as String),
      genero: json['genero'] as String,
      telefono: json['telefono'] as String,
      especialidad: json['especialidad'] as String,
      cedulaProfesional: json['cedula_profesional'] as String,
      correo: json['correo'] as String,
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'clave': instance.clave,
      'nombre': instance.nombre,
      'apellido_paterno': instance.apellidoPaterno,
      'apellido_materno': instance.apellidoMaterno,
      'fecha_nacimiento': instance.fechaNacimiento.toIso8601String(),
      'genero': instance.genero,
      'telefono': instance.telefono,
      'especialidad': instance.especialidad,
      'cedula_profesional': instance.cedulaProfesional,
      'correo': instance.correo,
    };
