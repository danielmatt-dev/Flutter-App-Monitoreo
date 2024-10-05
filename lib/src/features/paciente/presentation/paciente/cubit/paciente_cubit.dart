import 'package:app_plataforma/src/features/paciente/domain/entities/mapper/paciente_map_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_paciente.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'paciente_cubit_state.dart';

class PacienteCubit extends Cubit<PacienteCubitState> {

  final BuscarPaciente buscarPaciente;
  final PacienteMapMapper mapper;

  PacienteCubit({
    required this.buscarPaciente,
    required this.mapper,
  }): super(PacienteCubitLoading());

  Future<void> buscarDatosPaciente() async {

    final result = await buscarPaciente.call(NoParams());

    result.fold(
            (failure) => emit(PacienteCubitError(failure.toString())),
            (paciente) {

              final mapContacto = mapper.toMapContacto(paciente);
              final mapTecnica = mapper.toMapFichaTecnica(paciente);
              final mapSomatometria = mapper.toMapSomatometria(paciente);
              final mapMedica = mapper.toMapFichaMedica(paciente);
              final mapDoctor = mapper.toMapDoctor(paciente);

              final mapData = {
                ...mapContacto,
                ...mapTecnica,
                ...mapSomatometria,
                ...mapMedica
              };

              emit(PacienteCubitSuccess(
                  mapContacto, mapTecnica, mapSomatometria, mapMedica, mapDoctor,
                  mapData));
            }
    );

  }

}