import 'package:app_plataforma/src/features/paciente/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/paciente/data/models/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasourceImpl extends AuthLocalDatasource {

  final SharedPreferences _preferences;

  AuthLocalDatasourceImpl(this._preferences);

  @override
  Future<void> saveAuthResponseModel(AuthResponseModel authResponseModel) async {

    final folio = _convertirIdPacienteAFolio(authResponseModel.idPaciente);

    await _preferences.setInt('folio', folio ?? 0);
    await _preferences.setString('id_paciente', authResponseModel.idPaciente);
    await _preferences.setString('token', authResponseModel.token);
    await _preferences.setString('fecha_expiracion', authResponseModel.fechaExpiracion.toIso8601String());

  }

  @override
  AuthResponseModel? getAuthResponseModel(){
    final idPaciente = _preferences.getString('id_paciente');
    final token = _preferences.getString('token');
    final fechaExpiracion = _preferences.getString('fecha_expiracion');

    if (idPaciente == null || token == null || fechaExpiracion == null) {
      return null;
    }

    return AuthResponseModel(
        idPaciente: idPaciente,
        token: token,
        fechaExpiracion: DateTime.parse(fechaExpiracion)
    );

  }

  @override
  Future<void> setIdPaciente(String idPaciente) async =>
    await _preferences.setString('id_paciente', idPaciente);

  @override
  String? getIdPaciente() => _preferences.getString('id_paciente');

  @override
  Future<void> setFolio(int folio) async =>
    await _preferences.setInt('folio', folio);

  @override
  int? getFolio() => _preferences.getInt('folio');

  @override
  Future<void> setToken(String token) async =>
      await _preferences.setString('token', token);

  @override
  String? getToken() => _preferences.getString('token');

  @override
  Future<void> setFechaExpiracion(DateTime fechaExpiracion) async =>
    await _preferences.setString('fecha_expiracion', fechaExpiracion.toIso8601String());

  @override
  DateTime? getFechaExpiracion() {
    String? date = _preferences.getString('fecha_expiracion');
    return date != null ? DateTime.parse(date) : null;
  }

  @override
  Future<bool> clearAllLocalDataSource() async =>
    await _preferences.clear();

  int? _convertirIdPacienteAFolio(String idPaciente) =>
      int.tryParse(idPaciente.substring(2));

}

// <>