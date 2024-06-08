import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/local/valor_glucosa_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValorGlucosaLocalDatasourceImpl extends ValorGlucosaLocalDatasource {

  final SharedPreferences _preferences;

  ValorGlucosaLocalDatasourceImpl(this._preferences);

  @override
  String? getIdPaciente() => _preferences.getString('id_paciente');

  @override
  int? getFolio() => _preferences.getInt('folio');

}