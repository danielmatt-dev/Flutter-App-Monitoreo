import 'package:app_plataforma/src/features/tratamiento/data/data_sources/remote/tratamiento_remote_datasource.dart';
import 'package:app_plataforma/src/features/tratamiento/data/data_sources/remote/impl/tratamiento_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/tratamiento/data/models/mapper/tratamiento_mapper.dart';
import 'package:app_plataforma/src/features/tratamiento/data/repositories/tratamiento_adapter.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/repositories/tratamiento_repository.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/usecases/buscar_tratamientos.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/usecases/buscar_tratamientos_paciente.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/usecases/guardar_tratamientos.dart';
import 'package:app_plataforma/src/features/tratamiento/presentation/cubit/tratamiento_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

initTratamientoInjections() {

  /*  Remote Datasource  */
  sl.registerSingleton<TratamientoRemoteDatasource>(
      TratamientoRemoteDatasourceImpl(sl()),
  );

  /*  Mapper  */
  sl.registerSingleton<TratamientoMapper>(TratamientoMapperImpl());

  /*  Repository  */
  sl.registerSingleton<TratamientoRepository>(
      TratamientoAdapter(sl(), sl(), sl()),
  );

  /*  Use Cases  */
  sl.registerSingleton<BuscarTratamientos>(BuscarTratamientos(sl()));

  sl.registerSingleton<BuscarTratamientosPaciente>(BuscarTratamientosPaciente(sl()));

  sl.registerSingleton<GuardarTratamientos>(GuardarTratamientos(sl()));

  /*  Cubit  */
  sl.registerSingleton<TratamientoCubit>(
      TratamientoCubit(
          buscarTratamientos: sl(),
          buscarTratamietosPaciente: sl(),
          guardarTratamientos: sl()
      )
  );

}