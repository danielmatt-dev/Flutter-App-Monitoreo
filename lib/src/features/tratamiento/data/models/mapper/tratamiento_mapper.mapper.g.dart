// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tratamiento_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class TratamientoMapperImpl extends TratamientoMapper {
  TratamientoMapperImpl() : super();

  @override
  Tratamiento toTratamiento(TratamientoModel model) {
    final tratamiento = Tratamiento(
      idTratamiento: model.idTratamiento,
      nombre: model.nombre,
      tipo: model.tipo,
    );
    return tratamiento;
  }

  @override
  TratamientoModel toTratamientoModel(Tratamiento entity) {
    final tratamientomodel = TratamientoModel(
      idTratamiento: entity.idTratamiento,
      nombre: entity.nombre,
      tipo: entity.tipo,
    );
    return tratamientomodel;
  }

  @override
  TratamientoPacienteModel toTratamientoPacienteModel(
      TratamientoPaciente entity) {
    final tratamientopacientemodel = TratamientoPacienteModel(
        tratamientos:
            entity.tratamientos.map((x) => toTratamientoModel(x)).toList());
    return tratamientopacientemodel;
  }

  @override
  TratamientoPaciente toTratamientoPaciente(TratamientoPacienteModel model) {
    final tratamientopaciente = TratamientoPaciente(
        tratamientos: model.tratamientos.map((x) => toTratamiento(x)).toList());
    return tratamientopaciente;
  }
}
