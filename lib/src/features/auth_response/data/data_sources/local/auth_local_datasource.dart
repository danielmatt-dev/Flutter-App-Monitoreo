import 'package:app_plataforma/src/features/auth_response/data/models/auth_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthLocalDatasource {

  Future<Either<Exception, bool>> saveAuthResponseModel(AuthResponseModel authResponseModel);

  Either<Exception, AuthResponseModel> getAuthResponseModel();

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
// <>