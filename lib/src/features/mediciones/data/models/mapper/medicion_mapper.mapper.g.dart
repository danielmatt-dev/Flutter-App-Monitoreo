// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicion_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class MedicionMapperImpl extends MedicionMapper {
  MedicionMapperImpl() : super();

  @override
  Medicion toMedicion(MedicionModel model) {
    final medicion = Medicion(
      folio: model.folio,
      medicion: model.medicion,
      fecha: model.fecha,
      tipo: model.tipo,
    );
    return medicion;
  }
}
