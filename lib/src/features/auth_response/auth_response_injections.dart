import 'package:app_plataforma/src/features/auth_response/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/auth_response/data/data_sources/local/impl/auth_local_datasource_impl.dart';
import 'package:app_plataforma/src/features/auth_response/data/models/mapper/auth_response_mapper.dart';
import 'package:app_plataforma/src/features/auth_response/data/repositories/auth_adapter.dart';
import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initAuthResponseInjections() async {

  /*  Local Datasource  */
  sl.registerSingleton<AuthLocalDatasource>(AuthLocalDatasourceImpl(sl<SharedPreferences>()));

  /*  Mapper  */
  sl.registerSingleton<AuthResponseMapper>(AuthResponseMapperImpl());

  /*  Repository  */
  sl.registerSingletonWithDependencies<AuthRepository>(
          () => AuthAdapter(
              local: sl<AuthLocalDatasource>(),
              mapper: sl<AuthResponseMapper>()
          ),
    dependsOn: [AuthLocalDatasource, AuthResponseMapper]
  );


}