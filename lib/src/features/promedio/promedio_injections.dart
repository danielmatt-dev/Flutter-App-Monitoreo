import 'package:app_plataforma/src/features/promedio/presentation/bloc/promedio_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

initPromedioInjectios() {

  /*  Bloc  */
  sl.registerSingleton<PromedioBloc>(
      PromedioBloc(
          buscarPromedioGlucosa: sl(),
          buscarPromedioSistolica: sl(),
          buscarPromedioDiastolica: sl()
      )
  );

}