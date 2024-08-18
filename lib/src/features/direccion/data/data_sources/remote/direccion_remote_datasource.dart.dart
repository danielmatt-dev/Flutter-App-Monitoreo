import 'package:app_plataforma/src/features/direccion/data/models/direccion_model.dart';
import 'package:app_plataforma/src/features/direccion/data/models/direccion_response_model.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class DireccionRemoteDatasource {

  Future<Either<Exception, DireccionResponseModel>> buscarDireccion(String codigoPostal, String token);

  Future<Either<Exception, bool>> actualizarDireccion(DireccionModel model, String token);

  Future<Either<Exception, DireccionModel>> buscarDireccionPaciente(String id, String token);

}