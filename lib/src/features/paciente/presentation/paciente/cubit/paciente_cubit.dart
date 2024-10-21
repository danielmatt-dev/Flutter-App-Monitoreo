import 'package:app_plataforma/src/features/paciente/domain/entities/mapper/paciente_map_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_paciente.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/iniciar_sesion.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'paciente_cubit_state.dart';

class PacienteCubit extends Cubit<PacienteCubitState> {

  final IniciarSesion iniciarSesion;
  final BuscarPaciente buscarPaciente;
  final PacienteMapMapper mapper;

  PacienteCubit({
    required this.iniciarSesion,
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

  Future<void> loginPaciente(String correo, String password) async {

    emit(PacienteCubitLoading());

    final result = await iniciarSesion.call(Usuario(correo: correo, password: password));

    result.fold(
          (failure) {

            if(failure is BadCredentialsException){
              emit(const BadCredentialsPacienteError());
              return;
            }

            emit(PacienteCubitError(failure.toString()));
            },
          (_) => emit(const LoginPacienteSuccess()),
    );
  }

}