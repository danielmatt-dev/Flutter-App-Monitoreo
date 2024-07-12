import 'package:app_plataforma/src/features/auth_response/domain/usecases/buscar_correo.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/buscar_usuario.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/mapper/paciente_map_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_update_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/actualizar_paciente.dart';
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
  final ActualizarPaciente actualizarPaciente;
  final PacienteMapMapper mapper;
  final BuscarUsuario buscarUsuario;
  final BuscarCorreo buscarCorreo;

  PacienteBloc({
    required this.buscarPacientePorId,
    required this.actualizarPaciente,
    required this.mapper,
    required this.buscarUsuario,
    required this.buscarCorreo
  }) : super(PacienteInicial()) {
    on<BuscarDatosPacienteEvent>(_obtenerDatosPaciente);
    on<ActualizarPacienteEvent>(_actualizarPaciente);
    on<GetUserAndEmailEvent>(_obtenerUsuarioCorreo);
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
    
  Future<void> _obtenerUsuarioCorreo(
      GetUserAndEmailEvent event, 
      Emitter<PacienteState> emitter
  ) async {

    String usuario = '';
    String correo = '';
    
    final result = await buscarUsuario.call(NoParams());
    final result2 = await buscarCorreo.call(NoParams()); 
    
    result.fold(
            (failure) => emitter(PacienteError(failure.toString())), 
            (success) => usuario = success
    );

    result2.fold(
            (failure) => emitter(PacienteError(failure.toString())),
            (success) => correo = success
    );

    print('Datos datos datosssss $usuario $correo');
    emitter(UserAndEmailSuccess(usuario, correo));
  }

  }

// <>