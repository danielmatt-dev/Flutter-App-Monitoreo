// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tratamiento_paciente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TratamientoPacienteModel _$TratamientoPacienteModelFromJson(
        Map<String, dynamic> json) =>
    TratamientoPacienteModel(
      tratamientos: (json['tratamientos'] as List<dynamic>)
          .map((e) => TratamientoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..folio = (json['folio'] as num).toInt();

Map<String, dynamic> _$TratamientoPacienteModelToJson(
        TratamientoPacienteModel instance) =>
    <String, dynamic>{
      'folio': instance.folio,
      'tratamientos': instance.tratamientos,
    };
