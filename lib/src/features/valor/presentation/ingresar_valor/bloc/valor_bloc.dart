import 'package:app_plataforma/src/features/valor/domain/entities/impl/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/impl/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/glucosa/ingresar_valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/presion/ingresar_valor_presion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'valor_event.dart';
part 'valor_state.dart';

// <>
class ValorGlucosaBloc extends Bloc<ValorGlucosaEvent, ValorGlucosaState>{

  final IngresarValorGlucosa ingresarValorGlucosa;
  final IngresarValorPresion ingresarValorPresion;

  ValorGlucosaBloc({
    required this.ingresarValorGlucosa,
    required this.ingresarValorPresion
  }) : super (ValorGlucosaInicial()) {
    on<SaveValorGlucosaEvent>(_ingresarValorGlucosaEvent);
    on<SaveValorPresionEvent>(_ingresarValorPresionEvent);
  }

  Future<void> _ingresarValorGlucosaEvent(
      SaveValorGlucosaEvent event,
      Emitter<ValorGlucosaState> emitter
  ) async {

    emitter(ValorGlucosaLoading());

    final saveValor = await ingresarValorGlucosa.call(
        ValorGlucosaRequest(
            valor: event.valor,
            medicion: event.medicion,
            notas: event.notas
        )
    );

    saveValor.fold(
            (failure) => emitter(ValorGlucosaError(error: failure.toString())),
            (success) => emitter(ValorGlucosaSaveSuccess())
    );

  }

  Future<void> _ingresarValorPresionEvent(
    SaveValorPresionEvent event,
    Emitter<ValorGlucosaState> emitter
  ) async {

    emitter(ValorGlucosaLoading());

    final result = await ingresarValorPresion.call(
        ValorPresionRequest(valorSistolica: event.valorSistolica,
            valorDiastolica: event.valorDiastolica,
            medicion: event.medicion,
            notas: event.notas)
    );

    result.fold(
            (failure) => emitter(ValorGlucosaError(error: failure.toString())),
            (success) => emitter(ValorPresionSaveSuccess())
    );

  }

}
