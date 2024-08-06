import 'package:app_plataforma/src/features/direccion/data/models/direccion_model.dart';
import 'package:app_plataforma/src/features/direccion/data/models/direccion_response_model.dart';
import 'package:app_plataforma/src/features/direccion/data/models/mapper/direccion_mapper.dart';
import 'package:app_plataforma/src/features/direccion/domain/entities/direccion.dart';
import 'package:app_plataforma/src/features/direccion/domain/entities/direccion_response.dart';

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
    return DireccionResponse(
      codigoPostal: model.codigoPostal,
      colonias: Map.fromEntries(model.colonias.map((colonia) => MapEntry(colonia.nombre, colonia.tipo))),
      ciudad: model.ciudad,
      estado: model.estado,
      pais: model.pais,
    );
  }

}