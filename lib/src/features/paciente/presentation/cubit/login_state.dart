part of 'login_cubit.dart';

// <>
@immutable
sealed class LoginState extends Equatable {

  const LoginState();

  factory LoginState.initial() => const LoginInitial();
  factory LoginState.loading() => const LoginLoading();
  factory LoginState.loginSuccess() => const LoginSuccess();
  factory LoginState.signupSuccess() => const SignUpSuccess();
  factory LoginState.error(String message) => LoginError(message);

  @override
  List<Object?> get props => [];

}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}

class SignUpSuccess extends LoginState {
  const SignUpSuccess();
}

class LoginError extends LoginState {

  final String message;

  const LoginError(this.message);

  @override
  List<Object?> get props => [message];

}