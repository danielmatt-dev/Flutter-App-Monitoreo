import 'package:app_plataforma/src/features/paciente/domain/entities/mapper/paciente_map_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_update_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/actualizar_paciente.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/actualizar_password.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_paciente.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'paciente_event.dart';
part 'paciente_state.dart';

// <>
class PacienteBloc extends Bloc<PacienteEvent, PacienteState>{

  final BuscarPaciente buscarPacientePorId;
  final ActualizarPassword actualizarPassword;
  final ActualizarPaciente actualizarPaciente;
  final PacienteMapMapper mapper;

  PacienteBloc({
    required this.buscarPacientePorId,
    required this.actualizarPassword,
    required this.actualizarPaciente,
    required this.mapper
  }) : super(PacienteInicial()) {
    on<BuscarDatosPacienteEvent>(_obtenerDatosPaciente);
    on<ActualizarPacienteEvent>(_actualizarPaciente);
  }

  Future<void> _obtenerDatosPaciente(
      BuscarDatosPacienteEvent event,
      Emitter<PacienteState> emitter
  ) async {
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

    Future<void> _actualizarPaciente(
        ActualizarPacienteEvent event,
        Emitter<PacienteState> emitter
    ) async {

      final result = await actualizarPaciente.call(
        PacienteUpdateRequest(
          nombre: event.nombre,
          apellidoPaterno: event.apellidoPaterno,
          apellidoMaterno: event.apellidoMaterno,
          fechaNacimiento: event.fechaNacimiento,
          genero: event.genero,
          estadoCivil: event.estadoCivil,
          nivelEstudios: event.nivelEstudios,
          numMiembrosHogar: event.numMiembrosHogar,
          tipoDiabetes: event.tipoDiabetes,
          tiempoDiabetes: event.tiempoDiabetes,
          peso: event.peso,
          talla: event.talla,
          telefono: '',
          correo: '',
          factorActividad: event.factorActividad
        )
      );

      return result.fold(
              (failure) => emitter(PacienteError(failure.toString())),
              (success) => emitter(PacienteUpdateSuccess())
      );

    }

  }

// <>