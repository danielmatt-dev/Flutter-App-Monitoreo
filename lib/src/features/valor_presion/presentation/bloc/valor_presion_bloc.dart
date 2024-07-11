import 'package:app_plataforma/src/features/valor/domain/entities/impl/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/capturar_valor_presion.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/presion/ingresar_valor_presion.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'valor_presion_event.dart';
part 'valor_presion_state.dart';

// <>
class ValorPresionBloc extends Bloc<ValorPresionEvent, ValorPresionState> {

  final CapturarValorPresion capturarValorPresion;
  final IngresarValorPresion ingresarValorPresion;

  ValorPresionBloc({
    required this.capturarValorPresion,
    required this.ingresarValorPresion
  }) : super (ValorPresionInicial()) {
    on<CaptureValorPresion>(_ingresarValorPresionEvent);
  }

  Future<void> _ingresarValorPresionEvent(
      CaptureValorPresion event,
      Emitter<ValorPresionState> emitter
      ) async {

    emitter(ValorPresionLoading());

    final result = await capturarValorPresion.call(
        CapturarValorPresionParams(
            valorSistolica: event.valorSistolica,
            valorDiastolica: event.valorDiastolica,
            medicion: event.medicion,
            notas: event.notas
        )
    );

    result.fold(
            (failure) => emitter(ValorPresionError(error: failure.toString())),
            (request) async {

              final saveValor = await ingresarValorPresion.call(request);

              saveValor.fold(
                      (failure) => emitter(ValorPresionError(error: failure.toString())),
                      (success) => emitter(ValorPresionSaveSuccess(success: success))
              );
            });

  }

}