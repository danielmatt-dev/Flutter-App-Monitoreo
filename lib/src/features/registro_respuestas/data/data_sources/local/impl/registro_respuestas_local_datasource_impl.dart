import 'package:app_plataforma/src/features/registro_respuestas/data/data_sources/local/registro_respuestas_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistroRespuestasLocalDatasourceImpl extends RegistroRespuestasLocalDatasource {

  final SharedPreferences _preferences;

  RegistroRespuestasLocalDatasourceImpl(this._preferences);

  @override
  int getFolio() {
    final int? folio = _preferences.getInt('folio');
    return folio ?? 0;
  }

}