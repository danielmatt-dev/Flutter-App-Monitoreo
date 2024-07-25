import 'package:app_plataforma/src/features/tratamiento/domain/usecases/buscar_tratamientos.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'tratamiento_state.dart';

// <>
class TratamientoCubit extends Cubit<TratamientoState> {

  final BuscarTratamientos buscarTratamientos;

  TratamientoCubit({
    required this.buscarTratamientos
  }): super(TratamientoInitial());

  void buscarListaTratamientos() async {

    emit(TratamientoLoading());

    final result = await buscarTratamientos.call(NoParams());
    print(result);

    result.fold(
            (failure) => emit(TratamientoError(failure.toString())),
            (tratamientos) {

              final orales = tratamientos
                  .where((tratamiento) => tratamiento.tipo == 'Oral')
                  .map((tratamiento) => tratamiento.nombre)
                  .toList();

              final insulina = tratamientos
                  .where((tratamiento) => tratamiento.tipo == 'Insulina')
                  .map((tratamiento) => tratamiento.nombre)
                  .toList();

              emit(TratamientoSuccess(insulina, orales));

            });

  }

}
