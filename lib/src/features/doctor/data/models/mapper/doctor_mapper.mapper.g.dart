// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class DoctorMapperImpl extends DoctorMapper {
  DoctorMapperImpl() : super();

  @override
  Doctor toDoctor(DoctorModel model) {
    final doctor = Doctor(
      clave: model.clave,
      nombre: model.nombre,
      apellidoPaterno: model.apellidoPaterno,
      apellidoMaterno: model.apellidoMaterno,
      telefono: model.telefono,
      especialidad: model.especialidad,
      cedulaProfesional: model.cedulaProfesional,
      correo: model.correo,
    );
    return doctor;
  }
}
