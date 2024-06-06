import 'package:app_plataforma/src/features/paciente/data/models/auth_response_model.dart';

abstract class AuthLocalDatasource {

  Future<void> saveAuthResponseModel(AuthResponseModel authResponseModel);

  AuthResponseModel? getAuthResponseModel();

  Future<void> setIdPaciente(String idPaciente);

  String? getIdPaciente();

  Future<void> setToken(String token);

  String? getToken();

  Future<void> setFechaExpiracion(DateTime fechaExpiracion);

  DateTime? getFechaExpiracion();

  Future<bool> clearAllLocalDataSource();

}
// <>