import 'package:app_plataforma/src/features/auth_response/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/auth_response/data/models/mapper/auth_response_mapper.dart';
import 'package:app_plataforma/src/features/auth_response/domain/entities/auth_response.dart';
import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

// <>
class AuthAdapter extends AuthRepository {

  final AuthLocalDatasource _local;
  final AuthResponseMapper _mapper;

  AuthAdapter({required AuthLocalDatasource local, required AuthResponseMapper mapper}) : _mapper = mapper, _local = local;

  @override
  Future<Either<Exception, bool>> clearAllLocalDataSource() => _local.clearAllLocalDataSource();

  @override
  Either<Exception, AuthResponse> getAuthResponse() =>
      _local.getAuthResponseModel().fold(
              (failure) => Left(failure),
              (model) => Right(_mapper.toAuthReponse(model))
      );

  @override
  Either<Exception, DateTime> getFechaExpiracion() => _local.getFechaExpiracion();

  @override
  Either<Exception, int> getFolio() => _local.getFolio();

  @override
  String getIdPaciente() => _local.getIdPaciente();

  @override
  String getToken() => _local.getToken();

  @override
  Future<Either<Exception, bool>> saveAuthResponse(AuthResponse authResponse) async =>
      await _local.saveAuthResponseModel(_mapper.toAuthReponseModel(authResponse));

  @override
  Future<Either<Exception, bool>> setFechaExpiracion(DateTime fechaExpiracion) async =>
      await _local.setFechaExpiracion(fechaExpiracion);

  @override
  Future<Either<Exception, bool>> setFolio(int folio) async =>
      await _local.setFolio(folio);

  @override
  Future<Either<Exception, bool>> setIdPaciente(String idPaciente) async =>
      await _local.setIdPaciente(idPaciente);

  @override
  Future<Either<Exception, bool>> setToken(String token) async =>
      await _local.setToken(token);

  @override
  String getCorreo() => _local.getCorreo();

  @override
  String getUsuario() => _local.getUsuario();

  @override
  bool isDarkMode() => _local.isDarkMode();

  @override
  Future<Either<Exception, bool>> setCorreo(String correo) => _local.setCorreo(correo);

  @override
  Future<Either<Exception, bool>> setIsDarkMode(bool isDarkMode) async => await _local.setIsDarkMode(isDarkMode);

  @override
  Future<Either<Exception, bool>> setUsuario(String nombre) => _local.setUsuario(nombre);

  @override
  String getFcmToken() => _local.getFcmToken();

  @override
  Future<Either<Exception, bool>> setFcmToken(String fcmToken) async => _local.setFcmToken(fcmToken);

  @override
  Future<Either<Exception, bool>> setTienePerfilAsignado(bool tienePerfilAsignado) => _local.setTienePerfilAsignado(tienePerfilAsignado);

  @override
  bool tienePerfilAsignado() => _local.getTienePerfilAsignado();

  @override
  Future<Either<Exception, bool>> removeFechaExpiracion() async => await _local.removeFechaExpiracion();

}