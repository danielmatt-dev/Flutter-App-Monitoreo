import 'package:app_plataforma/src/features/auth_response/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/auth_response/data/data_sources/local/impl/auth_local_datasource_impl.dart';
import 'package:app_plataforma/src/features/auth_response/data/models/mapper/auth_response_mapper.dart';
import 'package:app_plataforma/src/features/auth_response/data/repositories/auth_adapter.dart';
import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/buscar_correo.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/buscar_fcm_token.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/buscar_usuario.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/guardar_fcm_token.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

// <>
initAuthResponseInjections() {

  /*  Local Datasource  */
  sl.registerSingleton<AuthLocalDatasource>(AuthLocalDatasourceImpl(sl()));

  /*  Mapper  */
  sl.registerSingleton<AuthResponseMapper>(AuthResponseMapperImpl());

  /*  Repository  */
  sl.registerSingleton<AuthRepository>(AuthAdapter(local: sl(), mapper: sl()));

  /*  Use Cases  */
  sl.registerSingleton<BuscarUsuario>(BuscarUsuario(sl()));

  sl.registerSingleton<BuscarCorreo>(BuscarCorreo(sl()));

  sl.registerSingleton<BuscarFcmToken>(BuscarFcmToken(sl()));

  sl.registerSingleton<GuardarFcmToken>(GuardarFcmToken(sl()));

}