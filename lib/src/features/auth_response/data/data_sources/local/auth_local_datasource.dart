import 'package:app_plataforma/src/features/auth_response/data/models/auth_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthLocalDatasource {

  Future<Either<Exception, bool>> saveAuthResponseModel(AuthResponseModel authResponseModel);

  Either<Exception, AuthResponseModel> getAuthResponseModel();

  Future<Either<Exception, bool>> setIdPaciente(String idPaciente);

  String getIdPaciente();

  Future<Either<Exception, bool>> setFolio(int folio);

  Either<Exception, int> getFolio();

  Future<Either<Exception, bool>> setUsuario(String nombre);

  String getUsuario();

  Future<Either<Exception, bool>> setCorreo(String correo);

  String getCorreo();

  Future<Either<Exception, bool>> setIsDarkMode(bool isDarkMode);

  bool isDarkMode();

  Future<Either<Exception, bool>> setToken(String token);

  String getToken();

  Future<Either<Exception, bool>> setFechaExpiracion(DateTime fechaExpiracion);

  Either<Exception, DateTime> getFechaExpiracion();

  Future<Either<Exception, bool>> removeFechaExpiracion();

  Future<Either<Exception, bool>> clearAllLocalDataSource();

  Future<Either<Exception, bool>> setFcmToken(String fcmToken);

  String getFcmToken();

  Future<Either<Exception, bool>> setTienePerfilAsignado(bool tienePerfilAsignado);

  bool getTienePerfilAsignado();

}
// <>