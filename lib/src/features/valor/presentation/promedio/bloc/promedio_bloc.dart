import 'package:app_plataforma/src/features/valor/domain/entities/promedio.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/glucosa/buscar_promedio_glucosa.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/presion/buscar_promedio_presion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promedio_event.dart';
part 'promedio_state.dart';
part 'promedio_bloc.freezed.dart';

// <>
class PromedioBloc extends Bloc<PromedioEvent, PromedioState> {

  final BuscarPromedioGlucosa buscarPromedioGlucosa;
  final BuscarPromedioPresion buscarPromedioPresion;

  PromedioBloc({
    required this.buscarPromedioGlucosa,
    required this.buscarPromedioPresion
  }) : super (const PromedioState.initial()) {
    on<ObtenerPromedios>(_promedioValorGlucosaEvent);
  }

  Future<void> _promedioValorGlucosaEvent(ObtenerPromedios event,
      Emitter<PromedioState> emitter) async {
    emitter(const PromedioState.loading());

    final glucosa = await buscarPromedioGlucosa.call('glucosa');
    final sistolica = await buscarPromedioPresion.call('sistolica');
    final diastolica = await buscarPromedioPresion.call('diastolica');

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