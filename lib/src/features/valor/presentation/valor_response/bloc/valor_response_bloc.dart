import 'package:app_plataforma/src/features/valor/domain/entities/valor_response.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/glucosa/buscar_valores_glucosa_dia.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/presion/buscar_valores_presion_dia.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
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

    List<ValorResponse> valoresGlucosa = [];
    List<ValorResponse> valoresPresion = [];

    valoresGlucosaResult.fold(
          (failure) => valoresGlucosa = [],
          (valores) => valoresGlucosa = valores,
    );

    valoresPresionResult.fold(
          (failure) => valoresPresion = [],
          (valores) => valoresPresion = valores,
    );

    emitter(ValorGetListSuccess(valoresGlucosa: valoresGlucosa, valoresPresion: valoresPresion));
  }

}