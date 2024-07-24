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
}
