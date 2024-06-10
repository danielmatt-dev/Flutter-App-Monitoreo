import 'package:app_plataforma/src/features/auth_response/domain/entities/auth_response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {

  Future<Either<Exception, bool>> saveAuthResponse(AuthResponse authResponse);

  Either<Exception, AuthResponse> getAuthResponse();

  Future<Either<Exception, bool>> setIdPaciente(String idPaciente);

  Either<Exception, String> getIdPaciente();

  Future<Either<Exception, bool>> setFolio(int folio);

  Either<Exception, int> getFolio();

  Future<Either<Exception, bool>> setToken(String token);

  Either<Exception, String> getToken();

  Future<Either<Exception, bool>> setFechaExpiracion(DateTime fechaExpiracion);

  Either<Exception, DateTime> getFechaExpiracion();

  Future<Either<Exception, bool>> clearAllLocalDataSource();

}