import 'package:app_plataforma/src/features/direccion/domain/entities/direccion.dart';
import 'package:app_plataforma/src/features/direccion/domain/entities/direccion_response.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class DireccionRepository {

  Future<Either<Exception, bool>> actualizarDireccion(Direccion direccion);

  Future<Either<Exception, DireccionResponse>> buscarDireccion(String codigoPostal);

  Future<Either<Exception, Direccion>> buscarDireccionPaciente();

}