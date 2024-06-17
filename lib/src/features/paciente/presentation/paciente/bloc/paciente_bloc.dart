import 'package:app_plataforma/src/features/paciente/domain/entities/mapper/paciente_map_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_paciente.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'paciente_event.dart';
part 'paciente_state.dart';

class PacienteBloc extends Bloc<PacienteEvent, PacienteState>{

  final BuscarPaciente buscarPacientePorId;
  final PacienteMapMapper mapper;

  PacienteBloc({
    required this.buscarPacientePorId,
    required this.mapper
  }) : super(PacienteInicial()) {
    on<BuscarDatosPaciente>(_obtenerDatosPaciente);
  }

  _obtenerDatosPaciente(
      BuscarDatosPaciente event,
      Emitter<PacienteState> emitter) async {

    emitter(PacienteLoading());

    final result = await buscarPacientePorId.call(NoParams());

    result.fold(
            (failure) => emitter(PacienteError(failure.toString())),
            (paciente) {

              final mapPaciente = mapper.toMapPaciente(paciente);
              final mapDoctor = mapper.toMapDoctor(paciente);

              emitter(PacienteSuccess(mapPaciente, mapDoctor));

            }
    );

  }

}

// <>