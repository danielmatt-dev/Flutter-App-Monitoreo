// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteRequestModel _$PacienteRequestModelFromJson(
        Map<String, dynamic> json) =>
    PacienteRequestModel(
      nombre: json['nombre'] as String,
      apellidoPaterno: json['apellido_paterno'] as String,
      apellidoMaterno: json['apellido_materno'] as String,
      fechaNacimiento: json['fecha_nacimiento'] as String,
      genero: json['genero'] as String,
      estadoCivil: json['estado_civil'] as String,
      nivelEstudios: json['nivel_estudios'] as String,
      numMiembrosHogar: (json['num_miembros_hogar'] as num).toInt(),
      tipoDiabetes: json['tipo_diabetes'] as String,
      tiempoDiabetes: json['tiempo_diabetes'] as String,
      peso: (json['peso'] as num).toDouble(),
      talla: (json['talla'] as num).toDouble(),
      telefono: json['telefono'] as String,
      correo: json['correo'] as String,
      password: json['password'] as String,
      factorActividad: json['factor_actividad'] as String,
      claveDoctor: json['clave_doctor'] as String,
    );

Map<String, dynamic> _$PacienteRequestModelToJson(
        PacienteRequestModel instance) =>
    <String, dynamic>{
      'nombre': instance.nombre,
      'apellido_paterno': instance.apellidoPaterno,
      'apellido_materno': instance.apellidoMaterno,
      'fecha_nacimiento': instance.fechaNacimiento,
      'genero': instance.genero,
      'estado_civil': instance.estadoCivil,
      'nivel_estudios': instance.nivelEstudios,
      'num_miembros_hogar': instance.numMiembrosHogar,
      'tipo_diabetes': instance.tipoDiabetes,
      'tiempo_diabetes': instance.tiempoDiabetes,
      'peso': instance.peso,
      'talla': instance.talla,
      'factor_actividad': instance.factorActividad,
      'telefono': instance.telefono,
      'correo': instance.correo,
      'password': instance.password,
      'clave_doctor': instance.claveDoctor,
    };
