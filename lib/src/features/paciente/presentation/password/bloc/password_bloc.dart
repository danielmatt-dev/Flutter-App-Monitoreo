import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_password.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/actualizar_password.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/bloc/validation/confirm_password_validation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import 'validation/password_validation.dart';

part 'password_event.dart';
part 'password_form_state.dart';

// <>
class PasswordBloc extends Bloc<PasswordEvent, PasswordFormState> {

  final ActualizarPassword actualizarPassword;

  PasswordBloc({
    required this.actualizarPassword
  }) : super(const PasswordFormState()) {
    on<CurrentPasswordChanged>(_onCurrentPasswordChanged);
    on<NewPasswordChanged>(_onNewPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<PasswordFormSubmitted>(_onPasswordFormSubmitted);
    on<ResetPasswordForm>(_onResetPasswordForm);
  }

  void _onCurrentPasswordChanged(
      CurrentPasswordChanged event,
      Emitter<PasswordFormState> emitter
  ) {

    final currentPassword = Password.dirty(event.currentPassword);

    emitter((state).copyWith(
      currentPassword: currentPassword,
      status: Formz.validate([
        currentPassword,
        (state).newPassword,
        (state).confirmPassword
      ])
    ));

  }

  void _onNewPasswordChanged(
      NewPasswordChanged event,
      Emitter<PasswordFormState> emitter
  ) {

    final newPassword = Password.dirty(event.newPassword);
    final confirmPassword = ConfirmPassword.dirty(password: newPassword.value, value: state.confirmPassword.value);

    emitter(state.copyWith(
      newPassword: newPassword,
      confirmPassword: confirmPassword,
      status: Formz.validate([
        state.currentPassword,
        newPassword,
        confirmPassword
      ]),
      error: confirmPassword.error == PasswordValidationError.mismatch ? 'Las contraseñas no coinciden' : null,
    ));

  }

  void _onConfirmPasswordChanged(
      ConfirmPasswordChanged event,
      Emitter<PasswordFormState> emitter
  ) {

    final confirmPassword =  ConfirmPassword.dirty(password: state.newPassword.value, value: event.confirmPassword);

    emitter(state.copyWith(
      confirmPassword: confirmPassword,
      status: Formz.validate([
        state.currentPassword,
        state.newPassword,
        confirmPassword
      ]),
      error: confirmPassword.error == PasswordValidationError.mismatch ? 'Las contraseñas no coinciden' : null
    ));

  }

  Future<void> _onPasswordFormSubmitted(
      PasswordFormSubmitted event,
      Emitter<PasswordFormState> emitter,
  ) async {

    final currentState = state;

    if(!currentState.status.isValidated) return;

    emitter(currentState.copyWith(status: FormzStatus.submissionInProgress));

    final result = await actualizarPassword.call(
        PacientePassword(
            currentPassword: currentState.currentPassword.value,
            newPassword: currentState.newPassword.value
        )
    );

    return result.fold(
            (failure) => emitter(
                currentState.copyWith(
                    status: FormzStatus.submissionFailure,
                    error: failure.toString()
            )),
            (success) => emitter(
                currentState.copyWith(status: FormzStatus.submissionSuccess
            ))
    );

  }

  void _onResetPasswordForm(
      ResetPasswordForm event,
      Emitter<PasswordFormState> emitter
  ) {
    emitter(const PasswordFormState());
  }

}