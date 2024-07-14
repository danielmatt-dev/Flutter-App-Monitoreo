import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/configuracion_local_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/impl/configuracion_local_datasource_impl.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/sqflite/mediciones_helper.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

initSqlfInyections() {

  /*  Sqflite  */
  sl.registerSingleton<MedicionesHelper>(MedicionesHelper.instance);

  sl.registerSingleton<ConfiguracionLocalDatasource>(
    ConfiguracionLocalDatasourceImpl(sl<MedicionesHelper>()),
  );

}