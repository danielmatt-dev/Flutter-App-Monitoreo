import 'package:app_plataforma/src/features/paciente/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/paciente/data/models/auth_response_model.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasourceImpl extends AuthLocalDatasource {

  final SharedPreferences _preferences;

  AuthLocalDatasourceImpl(this._preferences);

  @override
  Future<Either<Exception, bool>> saveAuthResponseModel(AuthResponseModel authResponseModel) async {

    try {

      final folio = _convertirIdPacienteAFolio(authResponseModel.idPaciente);

      if(folio == null) {
        return Left(Exception('Folio no generado'));
      }

      await _preferences.setInt('folio', folio);
      await _preferences.setString('id_paciente', authResponseModel.idPaciente);
      await _preferences.setString('token', authResponseModel.token);
      await _preferences.setString('fecha_expiracion', authResponseModel.fechaExpiracion.toIso8601String());
      return const Right(true);

    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Either<Exception, AuthResponseModel> getAuthResponseModel(){

    try {

      final idPaciente = _preferences.getString('id_paciente');
      final token = _preferences.getString('token');
      final fechaExpiracion = _preferences.getString('fecha_expiracion');

      if (idPaciente == null || token == null || fechaExpiracion == null) {
        return Left(ResourceNotFoundException(message: 'Auth response no encontrado'));
      }

      return Right(
          AuthResponseModel(
              idPaciente: idPaciente,
              token: token,
              fechaExpiracion: DateTime.parse(fechaExpiracion)
          )
      );

    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, bool>> setIdPaciente(String idPaciente) async {
    try {
      final success = await _preferences.setString('id_paciente', idPaciente);

      if (!success) {
        return Left(Exception('Id no guardado'));
      }
      return const Right(true);

    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Either<Exception, String> getIdPaciente() {
    try {

      final idPaciente = _preferences.getString('id_paciente');

      if(idPaciente == null){
        return Left(Exception('Id del paciente no encontrado'));
      }

      return Right(idPaciente);

    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> setFolio(int folio) async {
    try {

      final success = await _preferences.setInt('folio', folio);

      if(!success){
        return Left(Exception('Folio no guardado'));
      }
      return const Right(true);

    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Either<Exception, int> getFolio() {
    try {

      final folio = _preferences.getInt('folio');

      if(folio == null){
        return Left(Exception('Folio no encontrado'));
      }

      return Right(folio);

    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> setToken(String token) async {
    try {
      final success = await _preferences.setString('token', token);

      if(!success){
        return Left(Exception('Token no guardado'));
      }
      return const Right(true);

    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }


  @override
  Either<Exception, String> getToken() {
    try {

      final token = _preferences.getString('token');

      if(token == null){
        return Left(Exception('Token no encontrado'));
      }
      return Right(token);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> setFechaExpiracion(DateTime fechaExpiracion) async {
    try {

      final success =  await _preferences.setString('fecha_expiracion', fechaExpiracion.toIso8601String());

      if(!success){
        return Left(Exception('Fecha de expiración no guardado'));
      }
      return const Right(true);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Either<Exception, DateTime> getFechaExpiracion() {
    try {

      final date = _preferences.getString('fecha_expiracion');

      if(date == null){
        return Left(Exception('Fecha de expiración no encontrado'));
      }

      return Right(DateTime.parse(date));

    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> clearAllLocalDataSource() async {
    try {

      final success = await _preferences.clear();

      if(!success){
        return Left(Exception('Error al limpiar base de datos'));
      }
      return const Right(true);

    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  int? _convertirIdPacienteAFolio(String idPaciente) => int.tryParse(idPaciente.substring(2));

}

// <>
