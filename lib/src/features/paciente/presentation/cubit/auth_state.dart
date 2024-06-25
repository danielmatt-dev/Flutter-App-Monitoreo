part of 'auth_cubit.dart';

// <>
@immutable
sealed class AuthState extends Equatable {

  const AuthState();

  factory AuthState.initial() => const LoginInitial();
  factory AuthState.loading() => const LoginLoading();
  factory AuthState.loginSuccess() => const LoginSuccess();
  factory AuthState.signupSuccess() => const SignUpSuccess();
  factory AuthState.error(String message) => LoginError(message);

  @override
  List<Object?> get props => [];

}

class LoginInitial extends AuthState {
  const LoginInitial();
}

class LoginLoading extends AuthState {
  const LoginLoading();
}

class LoginSuccess extends AuthState {
  const LoginSuccess();
}

class SignUpSuccess extends AuthState {
  const SignUpSuccess();
}

class LoginError extends AuthState {

  final String message;

  const LoginError(this.message);

  @override
  List<Object?> get props => [message];

}