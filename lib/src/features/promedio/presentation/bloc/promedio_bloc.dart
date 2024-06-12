import 'package:app_plataforma/src/features/promedio/domain/entities/promedio.dart';
import 'package:app_plataforma/src/features/promedio/domain/usecases/buscar_promedio_glucosa.dart';
import 'package:app_plataforma/src/features/promedio/domain/usecases/buscar_promedio_diastolica.dart';
import 'package:app_plataforma/src/features/promedio/domain/usecases/buscar_promedio_sistolica.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'promedio_event.dart';
part 'promedio_state.dart';

// <>
class PromedioBloc extends Bloc<PromedioEvent, PromedioState> {

  final BuscarPromedioGlucosa buscarPromedioGlucosa;
  final BuscarPromedioSistolica buscarPromedioSistolica;
  final BuscarPromedioDiastolica buscarPromedioDiastolica;

  PromedioBloc({
    required this.buscarPromedioGlucosa,
    required this.buscarPromedioSistolica,
    required this.buscarPromedioDiastolica
  }): super (AverageInicial()) {
    on<ObtenerPromedioGlucosa>(_promedioValorGlucosaEvent);
    on<ObtenerPromedioSistolica>(_obtenerPromedioSistolica);
    on<ObtenerPromedioDiastolica>(_obtenerPromedioDiastolica);
  }

  Future<void> _promedioValorGlucosaEvent(
      ObtenerPromedioGlucosa event,
      Emitter<PromedioState> emitter
      ) async {

    emitter(AverageLoading());

    final result = await buscarPromedioGlucosa.call(NoParams());

    result.fold(
            (failure) => emitter(AverageError(failure.toString())),
            (average) => emitter(AverageSuccess(average))
    );

  }

  Future<void> _obtenerPromedioSistolica(
      ObtenerPromedioSistolica event,
      Emitter<PromedioState> emitter,
      ) async {

    emitter(AverageLoading());

    final result = await buscarPromedioSistolica.call(NoParams());

    result.fold(
            (failure) => emitter(AverageError(failure.toString())),
            (average) => emitter(AverageSuccess(average))
    );

  }

  Future<void> _obtenerPromedioDiastolica(
      ObtenerPromedioDiastolica event,
      Emitter<PromedioState> emitter
      ) async {

    emitter(AverageLoading());

    final result = await buscarPromedioDiastolica.call(NoParams());

    result.fold(
            (failure) => emitter(AverageError(failure.toString())),
            (average) => emitter(AverageSuccess(average))
    );

  }

}