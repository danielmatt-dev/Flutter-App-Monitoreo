import 'package:app_plataforma/src/features/paciente/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/paciente/data/models/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasourceImpl extends AuthLocalDatasource {

  final SharedPreferences _preferences;

  AuthLocalDatasourceImpl(this._preferences);

  @override
  Future<void> saveAuthResponseModel(AuthResponseModel authResponseModel) async {
    await _preferences.setString('idPaciente', authResponseModel.idPaciente);
    await _preferences.setString('token', authResponseModel.token);
    await _preferences.setString('fechaExpiracion', authResponseModel.fechaExpiracion.toIso8601String());
  }

  @override
  AuthResponseModel? getAuthResponseModel(){
    final idPaciente = _preferences.getString('idPaciente');
    final token = _preferences.getString('token');
    final fechaExpiracion = _preferences.getString('fechaExpiracion');

    if(idPaciente != null && token != null && fechaExpiracion != null){
      return AuthResponseModel(
          idPaciente: idPaciente,
          token: token,
          fechaExpiracion: DateTime.parse(fechaExpiracion)
      );
    }
    return null;
  }

  @override
  Future<void> setIdPaciente(String idPaciente) async {
    await _preferences.setString('idPaciente', idPaciente);
  }

  @override
  String? getIdPaciente() {
    return _preferences.getString('idPaciente');
  }

  @override
  Future<void> setToken(String token) async {
    await _preferences.setString('token', token);
  }

  @override
  String? getToken() {
    return _preferences.getString('token');
  }

  @override
  Future<void> setFechaExpiracion(DateTime fechaExpiracion) async {
    await _preferences.setString('fechaExpiracion', fechaExpiracion.toIso8601String());
  }

  @override
  DateTime? getFechaExpiracion() {
    String? date = _preferences.getString('fechaExpiracion');
    return date != null ? DateTime.parse(date) : null;
  }

  @override
  Future<bool> clearAllLocalDataSource() async {
    return _preferences.clear();
  }

}

// <>