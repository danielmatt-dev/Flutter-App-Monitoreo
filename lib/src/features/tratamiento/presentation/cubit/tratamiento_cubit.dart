import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento_paciente.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/usecases/buscar_tratamientos.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/usecases/buscar_tratamientos_paciente.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/usecases/guardar_tratamientos.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'tratamiento_state.dart';

// <>
class TratamientoCubit extends Cubit<TratamientoState> {

  final BuscarTratamientos buscarTratamientos;
  final BuscarTratamientosPaciente buscarTratamietosPaciente;
  final GuardarTratamientos guardarTratamientos;

  TratamientoCubit({
    required this.buscarTratamientos,
    required this.buscarTratamietosPaciente,
    required this.guardarTratamientos
  }): super(TratamientoInitial());

  void buscarListaTratamientos() async {

    emit(TratamientoLoading());

    final result = await buscarTratamientos.call(NoParams());

    result.fold(
            (failure) => emit(TratamientoError(failure.toString())),
            (tratamientos) {

              final orales = tratamientos
                  .where((tratamiento) => tratamiento.tipo == 'Oral')
                  .map((tratamiento) => tratamiento)
                  .toList();

              final insulina = tratamientos
                  .where((tratamiento) => tratamiento.tipo == 'Insulina')
                  .map((tratamiento) => tratamiento)
                  .toList();

              emit(TratamientoSuccess(insulina, orales));

            });

  }

  void buscarTratamientosDelPaciente() async {

    final result = await buscarTratamietosPaciente.call(NoParams());

    result.fold(
            (failure) => emit(TratamientoError(failure.toString())),
            (tratamientos) {

              final orales = tratamientos.tratamientos
                  .where((tratamiento) => tratamiento.tipo == 'Oral')
                  .map((tratamiento) => tratamiento.nombre)
                  .join('\n');

              final insulinas = tratamientos.tratamientos
                  .where((tratamiento) => tratamiento.tipo == 'Insulina')
                  .map((tratamiento) => tratamiento.nombre)
                  .join('\n');

              emit(TratamientoListSuccess({'Medicamentos orales': orales, 'Insulina': insulinas}));
            }
            );

  }

  void guardarTratamientosPaciente(TratamientoPaciente tratamientos) async {

    final result = await guardarTratamientos.call(tratamientos);

    result.fold(
            (failure) => emit(TratamientoError(failure.toString())),
            (success) => emit(TratamientoSaveSuccess())
    );

  }

}