import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/crear_cuenta.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/iniciar_sesion.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/bloc/validation/password_validation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'validation/email_validation.dart';

part 'auth_state.dart';

// <>

class AuthCubit extends Cubit<AuthState> {

  final IniciarSesion iniciarSesion;
  final CrearCuenta crearCuenta;

  AuthCubit({
    required this.iniciarSesion,
    required this.crearCuenta,
  }) : super(const LoginInitial());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> loginPaciente() async {

    if (!state.status.isValidated) return;

    final result = await iniciarSesion.call(
        Usuario(correo: state.email.value, password: state.password.value));

    result.fold(
          (failure) => emit(LoginError(failure.toString())),
          (_) => emit(const LoginSuccess()),
    );
  }

  /*
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
  */

}