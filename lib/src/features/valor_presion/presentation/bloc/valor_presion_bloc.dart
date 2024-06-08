import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_response.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/buscar_valores_presion_dia.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/capturar_valor_presion.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/ingresar_valor_presion.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'valor_presion_event.dart';
part 'valor_presion_state.dart';

// <>
class ValorPresionBloc extends Bloc<ValorPresionEvent, ValorPresionState> {
  
  final BuscarValoresPresion buscarValoresDia;
  final CapturarValorPresion capturarValorPresion;
  final IngresarValorPresion ingresarValorPresion;
  
  ValorPresionBloc({
    required this.buscarValoresDia,
    required this.capturarValorPresion,
    required this.ingresarValorPresion
  }) : super (ValorPresionInicial()) {
    on<GetListValoresPresion>(_obtenerValoresDelDiaEvent);
    on<CaptureValorPresion>(_ingresarValorPresionEvent);
  }
  
  Future<void> _obtenerValoresDelDiaEvent(
      GetListValoresPresion event,
      Emitter<ValorPresionState> emitter
  ) async {
    
    emitter(ValorPresionLoading());
    
    final result = await buscarValoresDia.call(
        BuscarValoresPresionParams(
            folio: event.folio,
            fecha: event.fecha
        )
    );

    result.fold(
            (failure) async => emitter(ValorPresionError(error: failure.toString())),
            (valores) async => emitter(ValorPresionGetListSuccess(valores: valores))
    );

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
            (failure) async => emitter(ValorPresionError(error: failure.toString())),
            (request) async {

              final saveValor = await ingresarValorPresion.call(request);

              saveValor.fold(
                      (failure) async => emitter(ValorPresionError(error: failure.toString())),
                      (success) async => emitter(ValorPresionSaveSuccess(success: success))
              );
            });

  }

}