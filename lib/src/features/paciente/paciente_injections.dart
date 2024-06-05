import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/impl/paciente_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/paciente_remote_datasource.dart';
import 'package:app_plataforma/src/features/paciente/data/models/mapper/paciente_mapper.dart';
import 'package:app_plataforma/src/features/paciente/data/repositories/paciente_adapter.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_paciente_por_id.dart';
import 'package:app_plataforma/src/features/paciente/presentation/bloc/paciente_bloc.dart';
import '../../shared/utils/injections.dart';

// <>
initPacienteInjections(){

  /*  Remote Datasource  */
  sl.registerSingleton<PacienteRemoteDatasource>(PacienteRemoteDatasourceImpl(slDio));

  /*  Mapper  */
  sl.registerSingleton<PacienteMapper>(PacienteMapperImpl());

  /*  Repository  */
  sl.registerSingletonWithDependencies<PacienteRepository>(
          () => PacienteAdapter(
              remote: sl<PacienteRemoteDatasource>(),
              mapper: sl<PacienteMapper>()
          ),
    dependsOn: [PacienteRemoteDatasource, PacienteMapper]
  );

  /*  Use Cases  */
  sl.registerSingletonWithDependencies(
          () => BuscarPacientePorId(sl<PacienteRepository>()),
    dependsOn: [PacienteRepository]
  );

  /*  Bloc  */
  sl.registerFactory<PacienteBloc>(
          () => PacienteBloc(buscarPacientePorId: sl<BuscarPacientePorId>())
  );
  
}