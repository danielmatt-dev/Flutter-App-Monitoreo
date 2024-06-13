import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_response.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/buscar_valores_glucosa_dia.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/capturar_valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/ingresar_valor_glucosa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'valor_glucosa_event.dart';
part 'valor_glucosa_state.dart';

// <>
class ValorGlucosaBloc extends Bloc<ValorGlucosaEvent, ValorGlucosaState>{

  final BuscarValoresGlucosaDia buscarValoresDia;
  final CapturarValorGlucosa capturarValorGlucosa;
  final IngresarValorGlucosa ingresarValorGlucosa;

  ValorGlucosaBloc({
    required this.buscarValoresDia,
    required this.capturarValorGlucosa,
    required this.ingresarValorGlucosa,
  }) : super (ValorGlucosaInicial()) {
    on<GetListValoresGlucosa>(_obtenerValoresDelDiaEvent);
    on<CaptureValorGlucosa>(_ingresarValorGlucosaEvent);
  }

  Future<void> _obtenerValoresDelDiaEvent(
      GetListValoresGlucosa event,
      Emitter<ValorGlucosaState> emitter
  ) async {

    emitter(ValorGlucosaLoading());

    final result = await buscarValoresDia.call(event.fecha);

    result.fold(
            (failure) async => emitter(ValorGlucosaError(error: failure.toString())),
            (valores) async => emitter(ValorGlucosaGetListSuccess(valores: valores))
    );

  }

  Future<void> _ingresarValorGlucosaEvent(
      CaptureValorGlucosa event,
      Emitter<ValorGlucosaState> emitter
  ) async {

    emitter(ValorGlucosaLoading());

    final result = await capturarValorGlucosa.call(
        CapturarValorGlucosaParams(
            valor: event.valor,
            medicion: event.medicion,
            notas: event.notas
        )
    );

    await result.fold(
            (failure) async => emitter(ValorGlucosaError(error: failure.toString())),
            (request) async {

              final saveValor = await ingresarValorGlucosa.call(request);

              saveValor.fold(
                      (failure) => emitter(ValorGlucosaError(error: failure.toString())),
                      (success) => emitter(ValorGlucosaSaveSuccess(success: success))
              );
            });

  }

}
