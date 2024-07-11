// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_update_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteUpdateRequestModel _$PacienteUpdateRequestModelFromJson(
        Map<String, dynamic> json) =>
    PacienteUpdateRequestModel(
      folio: (json['folio'] as num).toInt(),
      nombre: json['nombre'] as String,
      apellidoPaterno: json['apellido_paterno'] as String,
      apellidoMaterno: json['apellido_materno'] as String,
      fechaNacimiento: DateTime.parse(json['fecha_nacimiento'] as String),
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
      factorActividad: json['factor_actividad'] as String,
    );

Map<String, dynamic> _$PacienteUpdateRequestModelToJson(
        PacienteUpdateRequestModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'nombre': instance.nombre,
      'apellido_paterno': instance.apellidoPaterno,
      'apellido_materno': instance.apellidoMaterno,
      'fecha_nacimiento': instance.fechaNacimiento.toIso8601String(),
      'genero': instance.genero,
      'estado_civil': instance.estadoCivil,
      'nivel_estudios': instance.nivelEstudios,
      'num_miembros_hogar': instance.numMiembrosHogar,
      'tipo_diabetes': instance.tipoDiabetes,
      'tiempo_diabetes': instance.tiempoDiabetes,
      'peso': instance.peso,
      'talla': instance.talla,
      'telefono': instance.telefono,
      'correo': instance.correo,
      'factor_actividad': instance.factorActividad,
    };
