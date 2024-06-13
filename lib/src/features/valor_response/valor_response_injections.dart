import 'package:app_plataforma/src/features/valor_response/domain/entities/mapper/valor_response_mapper.dart';
import 'package:app_plataforma/src/features/valor_response/domain/entities/mapper/valor_response_mapper_impl.dart';
import 'package:app_plataforma/src/features/valor_response/domain/usecases/buscar_valores_glucosa_dia.dart';
import 'package:app_plataforma/src/features/valor_response/domain/usecases/buscar_valores_presion_dia.dart';
import 'package:app_plataforma/src/features/valor_response/presentation/bloc/valor_response_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

initValorResponseInjections() {

  /*  Mapper  */
  sl.registerSingleton<ValorResponseMapper>(ValorResponseMapperImpl());

  /*  Use Cases */
  sl.registerSingleton<BuscarValoresGlucosaDia>(BuscarValoresGlucosaDia(sl()));

  sl.registerSingleton<BuscarValoresPresion>(BuscarValoresPresion(sl()),);

  /*  Bloc  */
  sl.registerSingleton<ValorResponseBloc>(
      ValorResponseBloc(
          buscarValoresGlucosa: sl(),
          buscarValoresPresion: sl()
      )
  );

}