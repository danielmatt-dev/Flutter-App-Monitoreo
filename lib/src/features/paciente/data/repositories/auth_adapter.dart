import 'package:app_plataforma/src/features/paciente/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/paciente/data/models/mapper/auth_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/auth_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

// <>
class AuthAdapter extends AuthRepository {

  final AuthLocalDatasource local;
  final AuthResponseMapper mapper;

  AuthAdapter({required this.local, required this.mapper});

  @override
  Future<Either<Exception, bool>> clearAllLocalDataSource() =>
      local.clearAllLocalDataSource();

  @override
  Either<Exception, AuthResponse> getAuthResponse() =>
      local.getAuthResponseModel().fold(
              (failure) => Left(failure),
              (model) => Right(mapper.toAuthReponse(model))
      );

  @override
  Either<Exception, DateTime> getFechaExpiracion() =>
      local.getFechaExpiracion().fold(
              (failure) => Left(failure),
              (fecha) => Right(fecha)
      );

  @override
  Either<Exception, int> getFolio() =>
      local.getFolio().fold(
              (failure) => Left(failure),
              (folio) => Right(folio)
      );

  @override
  Either<Exception, String> getIdPaciente() =>
      local.getIdPaciente().fold(
              (failure) => Left(failure),
              (id) => Right(id)
      );

  @override
  Either<Exception, String> getToken() =>
      local.getToken().fold(
              (failure) => Left(failure),
              (token) => Right(token)
      );

  @override
  Future<Either<Exception, bool>> saveAuthResponse(AuthResponse authResponse) =>
      local.saveAuthResponseModel(mapper.toAuthReponseModel(authResponse));

  @override
  Future<Either<Exception, bool>> setFechaExpiracion(DateTime fechaExpiracion) =>
      local.setFechaExpiracion(fechaExpiracion);

  @override
  Future<Either<Exception, bool>> setFolio(int folio) =>
      local.setFolio(folio);

  @override
  Future<Either<Exception, bool>> setIdPaciente(String idPaciente) =>
      local.setIdPaciente(idPaciente);

  @override
  Future<Either<Exception, bool>> setToken(String token) =>
      local.setToken(token);

}