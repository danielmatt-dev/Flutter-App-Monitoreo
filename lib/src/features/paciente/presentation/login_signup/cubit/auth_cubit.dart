import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_perfil_asignado.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/crear_cuenta.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/iniciar_sesion.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/reestablecer_password.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/validar_actualizacion_correo.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/validar_correo.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/validar_existencia_correo.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/bloc/validation/password_validation.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'validation/email_validation.dart';

part 'auth_state.dart';

// <>

class AuthCubit extends Cubit<AuthState> {

  final IniciarSesion iniciarSesion;
  final CrearCuenta crearCuenta;
  final ReestablecerPassword reestablecerPassword;
  final BuscarPerfilAsignado buscarPerfilAsignado;
  final ValidarExistenciaCorreo validarExistenciaCorreo;
  final ValidarActualizacionCorreo validarActualizacionCorreo;
  final ValidarCorreo validarCorreoReset;

  AuthCubit({
    required this.iniciarSesion,
    required this.crearCuenta,
    required this.reestablecerPassword,
    required this.buscarPerfilAsignado,
    required this.validarExistenciaCorreo,
    required this.validarActualizacionCorreo,
    required this.validarCorreoReset
  }) : super(const LoginInitial());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void emailValid(String value){

    final email = Email.dirty(value);

    //final isInvalid = Formz.validate([email]) == FormzStatus.invalid;

    emit(state.copyWith(
      email: email
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
          (failure) => emit(AuthError(failure.toString())),
          (_) => emit(const LoginSuccess()),
    );
  }

  Future<void> signupPaciente(String nombre,
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
      String telefono,
      String password,
      String factorActividad,
      String claveDoctor) async {
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
            telefono: telefono,
            correo: correo,
            password: password,
            factorActividad: factorActividad,
            claveDoctor: claveDoctor
        )
    );

    result.fold(
            (failure) => emit(AuthError(failure.toString())),
            (success) => emit(const SignUpSuccess())
    );
  }

  Future<void> searchPerfilAsignado() async {
    final result = await buscarPerfilAsignado.call(NoParams());

    result.fold(
            (failure) => emit(const AuthError('')),
            (success) => emit(PerfilAsignadoSuccess(success))
    );
  }

  Future<void> validarCorreo(String correo) async {
    final result = await validarExistenciaCorreo.call(correo);

    result.fold(
            (failure) => emit(const AuthError('Hubo una exception')),
            (success) =>
            emit(success
                ? NonValidateExitsCorreo()
                : ValidateExitsCorreoSuccess())
    );
  }

  Future<void> existePerfil() async {
    final result = await buscarPerfilAsignado.call(NoParams());

    result.fold(
            (failure) => emit(const AuthError('Hubo una exception')),
            (success) => emit(PerfilAsignadoSuccess(success))
    );
  }

  Future<void> validarActualizacion(String correo) async {
    final result = await validarActualizacionCorreo.call(correo);

    result.fold(
            (failure) => emit(const AuthError('Hubo una exception')),
            (success) => emit(ValidateUpdateCorreoSuccess(success))
    );
  }

  Future<void> validarCorreoResetPassword(String correo) async {

    emit(const LoginLoading());
    Future.delayed(const Duration(seconds: 3));

    final result = await validarCorreoReset.call(correo);

    result.fold(
        (failure) {
          if(failure is ResourceNotFoundException){
            emit(NonValidateCorreo());
            return;
          }
          emit(const AuthError(''));
        },
        (success) => emit(ValidateCorreoSuccess())
    );

  }

  Future<void> resetPasswordEvent(String correo, String password) async {

    emit(const LoginLoading());

    final result = await reestablecerPassword.call(
        Usuario(
            correo: correo,
            password: password
        )
    );

    result.fold(
        (failure) => emit(const AuthError('')) ,
        (success) => emit(ResetPasswordSuccess())
    );

  }

}