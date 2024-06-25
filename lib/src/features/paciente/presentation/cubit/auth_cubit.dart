import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/crear_cuenta.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/iniciar_sesion.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

// <>
class AuthCubit extends Cubit<AuthState> {

  final IniciarSesion iniciarSesion;
  final CrearCuenta crearCuenta;

  AuthCubit({
    required this.iniciarSesion,
    required this.crearCuenta
  }) : super (AuthState.initial());

  void loginLoading() {
    emit(AuthState.loading());
  }

  Future<void> loginPaciente(String correo, String password) async {

    emit(AuthState.loading());

    final result = await iniciarSesion.call(
        Usuario(correo: correo,
            password: password
        )
    );

    result.fold(
            (failure) => emit(AuthState.error(failure.toString())),
            (success) => emit(AuthState.loginSuccess())
    );

  }

  Future<void> signupPaciente(
      String nombre,
      String apellidoPaterno,
      String apellidoMaterno,
      String fechaNacimiento,
      String genero,
      String estadoCivil,
      String nivelEstudios,
      int numMiembrosHogar,
      String tipoDiabetes,
      String tiempoDiabetes,
      double peso,
      double talla,
      String correo,
      String password,
      String factorActividad,
      String claveDoctor,
      String nombreTratamiento,
  ) async {

    emit(AuthState.loading());

    final result = await crearCuenta.call(
        PacienteRequest(
            nombre: nombre,
            apellidoPaterno: apellidoPaterno,
            apellidoMaterno: apellidoMaterno,
            fechaNacimiento: fechaNacimiento,
            genero: genero,
            estadoCivil: estadoCivil,
            nivelEstudios: nivelEstudios,
            numMiembrosHogar: numMiembrosHogar,
            tipoDiabetes: tipoDiabetes,
            tiempoDiabetes: tiempoDiabetes,
            peso: peso,
            talla: talla,
            correo: correo,
            password: password,
            factorActividad: factorActividad,
            claveDoctor: claveDoctor,
            nombreTratamiento: nombreTratamiento
        )
    );

    result.fold(
            (failure) => emit(AuthState.error(failure.toString())),
            (success) => emit(AuthState.signupSuccess())
    );

  }

}