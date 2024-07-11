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
      id: direccion.id,
      colonia: direccion.colonia,
      codigoPostal: direccion.codigoPostal,
      asentamiento: direccion.asentamiento,
      calle: direccion.calle,
      numero: direccion.numero,
      entreCalleUno: direccion.entreCalleUno,
      entreCalleDos: direccion.entreCalleDos,
      ciudad: direccion.ciudad,
      estado: direccion.estado,
      pais: direccion.pais,
    );
    return direccionmodel;
  }

  @override
  DireccionResponse toDireccionResponse(DireccionResponseModel model) {
    final direccionresponse = DireccionResponse(
      colonias: model.colonias.map((x) => toColoniaResponse(x)).toList(),
      codigoPostal: model.codigoPostal,
      ciudad: model.ciudad,
      estado: model.estado,
      pais: model.pais,
    );
    return direccionresponse;
  }

  @override
  ColoniaResponse toColoniaResponse(ColoniaResponseModel model) {
    final coloniaresponse = ColoniaResponse(
      nombre: model.nombre,
      tipo: model.tipo,
    );
    return coloniaresponse;
  }
}
