import 'package:app_plataforma/src/features/promedio/domain/entities/promedio.dart';
import 'package:app_plataforma/src/features/promedio/domain/usecases/buscar_promedio_glucosa.dart';
import 'package:app_plataforma/src/features/promedio/domain/usecases/buscar_promedio_diastolica.dart';
import 'package:app_plataforma/src/features/promedio/domain/usecases/buscar_promedio_sistolica.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promedio_event.dart';
part 'promedio_state.dart';
part 'promedio_bloc.freezed.dart';

// <>
class PromedioBloc extends Bloc<PromedioEvent, PromedioState> {

  final BuscarPromedioGlucosa buscarPromedioGlucosa;
  final BuscarPromedioSistolica buscarPromedioSistolica;
  final BuscarPromedioDiastolica buscarPromedioDiastolica;

  PromedioBloc({
    required this.buscarPromedioGlucosa,
    required this.buscarPromedioSistolica,
    required this.buscarPromedioDiastolica
  }) : super (const PromedioState.initial()) {
    on<ObtenerPromedios>(_promedioValorGlucosaEvent);
  }

  Future<void> _promedioValorGlucosaEvent(ObtenerPromedios event,
      Emitter<PromedioState> emitter) async {
    emitter(const PromedioState.loading());

    final glucosa = await buscarPromedioGlucosa.call(NoParams());
    final sistolica = await buscarPromedioSistolica.call(NoParams());
    final diastolica = await buscarPromedioDiastolica.call(NoParams());

    List<Promedio> promedios = [];

    glucosa.fold(
            (failure) => PromedioState.error(failure.toString()),
            (average) => promedios.add(average)
    );

    sistolica.fold(
            (failure) => PromedioState.error(failure.toString()),
            (average) => promedios.add(average)
    );

    diastolica.fold(
            (failure) => PromedioState.error(failure.toString()),
            (average) => promedios.add(average)
    );

    emitter(PromedioState.success(promedios));

  }

}