import 'package:app_plataforma/src/features/valor_response/domain/entities/valor_response.dart';
import 'package:app_plataforma/src/features/valor_response/domain/usecases/buscar_valores_glucosa_dia.dart';
import 'package:app_plataforma/src/features/valor_response/domain/usecases/buscar_valores_presion_dia.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
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
    on<GetListValores>(_obtenerValoresPresionEvent);
  }

  Future<void> _obtenerValoresPresionEvent(
      GetListValores event,
      Emitter<ValorResponseState> emitter
      ) async {

    emitter(ValorResponseLoading());

    final List<Future<Either<Exception, List<ValorResponse>>>> futures = [
      buscarValoresGlucosa.call(event.fecha),
      buscarValoresPresion.call(event.fecha),
    ];

    final results = await Future.wait(futures);

    final valoresGlucosaResult = results[0];
    final valoresPresionResult = results[1];

    List<ValorResponse> _valoresGlucosa = [];
    List<ValorResponse> _valoresPresion = [];

    valoresGlucosaResult.fold(
          (failure) => _valoresGlucosa = [],
          (valores) => _valoresGlucosa = valores,
    );

    valoresPresionResult.fold(
          (failure) => _valoresPresion = [],
          (valores) => _valoresPresion = valores,
    );

    emitter(ValorGetListSuccess(valoresGlucosa: _valoresGlucosa, valoresPresion: _valoresPresion));
  }

}