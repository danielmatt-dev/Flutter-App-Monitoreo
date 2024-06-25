// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direccion_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class DireccionMapperImpl extends DireccionMapper {
  DireccionMapperImpl() : super();

  @override
  DireccionModel toDireccionModel(Direccion direccion) {
    final direccionmodel = DireccionModel(
      folio: direccion.folio,
      colonia: direccion.colonia,
      codigoPostal: direccion.codigoPostal,
      ciudad: direccion.ciudad,
      estado: direccion.estado,
      pais: direccion.pais,
    );
    return direccionmodel;
  }

  @override
  DireccionResponse toDireccionResponse(DireccionResponseModel model) {
    final direccionresponse = DireccionResponse(
      colonias: model.colonias.map((e) => e).toList(),
      codigoPostal: model.codigoPostal,
      ciudad: model.ciudad,
      estado: model.estado,
      pais: model.pais,
    );
    return direccionresponse;
  }
}
