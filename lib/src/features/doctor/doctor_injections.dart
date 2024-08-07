import 'package:app_plataforma/src/features/doctor/data/data_sources/remote/doctor_remote_datasource.dart';
import 'package:app_plataforma/src/features/doctor/data/data_sources/remote/impl/doctor_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/doctor/data/models/mapper/doctor_mapper.dart';
import 'package:app_plataforma/src/features/doctor/data/repositories/doctor_adapter.dart';
import 'package:app_plataforma/src/features/doctor/domain/repositories/doctor_repository.dart';
import 'package:app_plataforma/src/features/doctor/domain/usecases/buscar_doctores.dart';
import 'package:app_plataforma/src/features/doctor/domain/usecases/validar_clave_doctor.dart';
import 'package:app_plataforma/src/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

initDoctorInjections() {

  /*  Remote Datasource  */
  sl.registerSingleton<DoctorRemoteDatasource>(DoctorRemoteDatasourceImpl(sl()));

  /*  Mapper  */
  sl.registerSingleton<DoctorMapper>(DoctorMapperImpl());

  /*  Repository  */
  sl.registerSingleton<DoctorRepository>(
      DoctorAdapter(sl(), sl(), sl())
  );

  /*  Use Cases   */
  sl.registerSingleton<BuscarDoctores>(BuscarDoctores(sl()));
  sl.registerSingleton<ValidarClaveDoctor>(ValidarClaveDoctor(sl()));

  /*  Cubit   */
  sl.registerSingleton<DoctorCubit>(
      DoctorCubit(
          buscarDoctoresUseCase: sl(),
          validarClaveDoctorUseCase: sl()
      )
  );

}
