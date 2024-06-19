// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteResponseModel _$PacienteResponseModelFromJson(
        Map<String, dynamic> json) =>
    PacienteResponseModel(
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
      imc: (json['imc'] as num).toDouble(),
      rmd: (json['rmd'] as num).toDouble(),
      correo: json['correo'] as String,
      factorActividad: json['factor_actividad'] as String,
      nombreTratamiento: json['nombre_tratamiento'] as String,
      tipoTratamiento: json['tipo_tratamiento'] as String,
      claveDoctor: json['clave_doctor'] as String,
      nombreDoctor: json['nombre_doctor'] as String,
      especialidadDoctor: json['especialidad_doctor'] as String,
      telefonoDoctor: json['telefono_doctor'] as String,
      correoDoctor: json['correo_doctor'] as String,
    );

Map<String, dynamic> _$PacienteResponseModelToJson(
        PacienteResponseModel instance) =>
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
      'imc': instance.imc,
      'rmd': instance.rmd,
      'correo': instance.correo,
      'factor_actividad': instance.factorActividad,
      'nombre_tratamiento': instance.nombreTratamiento,
      'tipo_tratamiento': instance.tipoTratamiento,
      'clave_doctor': instance.claveDoctor,
      'nombre_doctor': instance.nombreDoctor,
      'especialidad_doctor': instance.especialidadDoctor,
      'telefono_doctor': instance.telefonoDoctor,
      'correo_doctor': instance.correoDoctor,
    };
