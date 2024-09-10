part of 'auth_cubit.dart';

// <>
class AuthState extends Equatable {
  const AuthState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final Email email;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;

  AuthState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, status, errorMessage];
}

class LoginInitial extends AuthState {
  const LoginInitial() : super();
}

class LoginLoading extends AuthState {
  const LoginLoading() : super(status: FormzStatus.submissionInProgress);
}

class LoginSuccess extends AuthState {
  const LoginSuccess() : super(status: FormzStatus.submissionSuccess);
}

class SignUpSuccess extends AuthState {
  const SignUpSuccess() : super(status: FormzStatus.submissionSuccess);
}

class PerfilAsignadoSuccess extends AuthState {

  final bool success;

  const PerfilAsignadoSuccess(this.success);

}

class ValidateExitsCorreoSuccess extends AuthState {}

class NonValidateExitsCorreo extends AuthState {}

class ValidateUpdateCorreoSuccess extends AuthState {

  final bool success;

  const ValidateUpdateCorreoSuccess(this.success);

}

class AuthError extends AuthState {
  const AuthError(String message)
      : super(status: FormzStatus.submissionFailure, errorMessage: message);

  @override
  List<Object?> get props => [errorMessage];
}

class ValidateCorreoSuccess extends AuthState {}

class NonValidateCorreo extends AuthState {}

class ValidatedCorreo extends AuthState {

  final bool isInvalid;

  const ValidatedCorreo(this.isInvalid);

}

class ResetPasswordSuccess extends AuthState {}
