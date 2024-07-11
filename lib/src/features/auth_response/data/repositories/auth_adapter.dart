import 'package:app_plataforma/src/features/auth_response/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/auth_response/data/models/mapper/auth_response_mapper.dart';
import 'package:app_plataforma/src/features/auth_response/domain/entities/auth_response.dart';
import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

// <>
class AuthAdapter extends AuthRepository {

  final AuthLocalDatasource local;
  final AuthResponseMapper mapper;

  AuthAdapter({required this.local, required this.mapper});

  @override
  Future<Either<Exception, bool>> clearAllLocalDataSource() => local.clearAllLocalDataSource();

  @override
  Either<Exception, AuthResponse> getAuthResponse() =>
      local.getAuthResponseModel().fold(
              (failure) => Left(failure),
              (model) => Right(mapper.toAuthReponse(model))
      );

  @override
  Either<Exception, DateTime> getFechaExpiracion() => local.getFechaExpiracion();

  @override
  Either<Exception, int> getFolio() => local.getFolio();

  @override
  Either<Exception, String> getIdPaciente() => local.getIdPaciente();

  @override
  Either<Exception, String> getToken() => local.getToken();

  @override
  Future<Either<Exception, bool>> saveAuthResponse(AuthResponse authResponse) async =>
      await local.saveAuthResponseModel(mapper.toAuthReponseModel(authResponse));

  @override
  Future<Either<Exception, bool>> setFechaExpiracion(DateTime fechaExpiracion) async =>
      await local.setFechaExpiracion(fechaExpiracion);

  @override
  Future<Either<Exception, bool>> setFolio(int folio) async =>
      await local.setFolio(folio);

  @override
  Future<Either<Exception, bool>> setIdPaciente(String idPaciente) async =>
      await local.setIdPaciente(idPaciente);

  @override
  Future<Either<Exception, bool>> setToken(String token) async =>
      await local.setToken(token);

  @override
  Either<Exception, String> getCorreo() => local.getCorreo();

  @override
  Either<Exception, String> getUsuario() => local.getUsuario();

  @override
  Either<Exception, bool> isDarkMode() => local.isDarkMode();

  @override
  Future<Either<Exception, bool>> setCorreo(String correo) => local.setCorreo(correo);

  @override
  Future<Either<Exception, bool>> setIsDarkMode(bool isDarkMode) async => await local.setIsDarkMode(isDarkMode);

  @override
  Future<Either<Exception, bool>> setUsuario(String nombre) => local.setUsuario(nombre);

}