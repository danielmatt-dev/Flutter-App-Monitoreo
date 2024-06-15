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
  }) : super (AverageInicial()) {
    on<ObtenerPromedios>(_promedioValorGlucosaEvent);
  }

  Future<void> _promedioValorGlucosaEvent(ObtenerPromedios event,
      Emitter<PromedioState> emitter) async {
    emitter(AverageLoading());

    final glucosa = await buscarPromedioGlucosa.call(NoParams());
    final sistolica = await buscarPromedioSistolica.call(NoParams());
    final diastolica = await buscarPromedioDiastolica.call(NoParams());

    List<Promedio> _promedios = [];

    glucosa.fold(
            (_) => _,
            (average) => _promedios.add(average)
    );

    sistolica.fold(
            (_) => _,
            (average) => _promedios.add(average)
    );

    diastolica.fold(
            (_) => _,
            (average) => _promedios.add(average)
    );

    emitter(AverageListSuccess(_promedios));

  }

}