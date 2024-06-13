import 'package:app_plataforma/src/features/valor_response/domain/entities/valor_response.dart';
import 'package:app_plataforma/src/features/valor_response/domain/usecases/buscar_valores_glucosa_dia.dart';
import 'package:app_plataforma/src/features/valor_response/domain/usecases/buscar_valores_presion_dia.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'valor_response_event.dart';
part 'valor_response_state.dart';

// <>
class ValorResponseBloc extends Bloc<ValorResponseEvent, ValorResponseState> {

  final BuscarValoresPresion buscarValoresPresion;
  final BuscarValoresGlucosaDia buscarValoresGlucosa;

  ValorResponseBloc({
    required this.buscarValoresGlucosa,
    required this.buscarValoresPresion
  }) : super (ValorResponseInicial()) {
    on<GetListValoresPresion>(_obtenerValoresPresionEvent);
    on<GetListValoresGlucosa>(_obtenerValoresGlucosaEvent);
  }

  Future<void> _obtenerValoresPresionEvent(
      GetListValoresPresion event,
      Emitter<ValorResponseState> emitter
      ) async {

    emitter(ValorResponseLoading());

    final result = await buscarValoresPresion.call(event.fecha);

    result.fold(
            (failure) => emitter(ValorResponseError(error: failure.toString())),
            (valores) => emitter(ValorGetListSuccess(valores: valores))
    );

  }

  Future<void> _obtenerValoresGlucosaEvent(
      GetListValoresGlucosa event,
      Emitter<ValorResponseState> emitter
      ) async {

    emitter(ValorResponseLoading());

    final result = await buscarValoresGlucosa.call(event.fecha);

    result.fold(
            (failure) async => emitter(ValorResponseError(error: failure.toString())),
            (valores) async => emitter(ValorGetListSuccess(valores: valores))
    );

  }

}