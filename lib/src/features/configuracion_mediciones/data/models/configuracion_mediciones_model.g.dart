// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracion_mediciones_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfiguracionMedicionesModel _$ConfiguracionMedicionesModelFromJson(
        Map<String, dynamic> json) =>
    ConfiguracionMedicionesModel(
      idPaciente: json['idPaciente'] as String,
      medicionPresionTemprano: json['medicionMañana'] as String,
      medicionPresionTarde: json['medicionPresionTarde'] as String,
      medicionPresionNoche: json['medicionPresionNoche'] as String,
      medicionGlucosaAntesDesayuno:
          json['medicionGlucosaAntesDesayuno'] as bool,
      medicionGlucosaAntesComida: json['medicionGlucosaAntesComida'] as bool,
      medicionGlucosaDosHorasDespues:
          json['medicionGlucosaDosHorasDespues'] as bool,
      medicionGlucosaAntesCena: json['medicionGlucosaAntesCena'] as bool,
    );

Map<String, dynamic> _$ConfiguracionMedicionesModelToJson(
        ConfiguracionMedicionesModel instance) =>
    <String, dynamic>{
      'idPaciente': instance.idPaciente,
      'medicionMañana': instance.medicionPresionTemprano,
      'medicionPresionTarde': instance.medicionPresionTarde,
      'medicionPresionNoche': instance.medicionPresionNoche,
      'medicionGlucosaAntesDesayuno': instance.medicionGlucosaAntesDesayuno,
      'medicionGlucosaAntesComida': instance.medicionGlucosaAntesComida,
      'medicionGlucosaDosHorasDespues': instance.medicionGlucosaDosHorasDespues,
      'medicionGlucosaAntesCena': instance.medicionGlucosaAntesCena,
    };
