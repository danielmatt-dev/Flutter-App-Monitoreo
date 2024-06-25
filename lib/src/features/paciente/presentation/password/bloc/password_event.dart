part of 'password_bloc.dart';

@immutable
sealed class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];

}

class CurrentPasswordChanged extends PasswordEvent {
  final String currentPassword;

  const CurrentPasswordChanged(this.currentPassword);

  @override
  List<Object> get props => [currentPassword];
}

class NewPasswordChanged extends PasswordEvent {
  final String newPassword;

  const NewPasswordChanged(this.newPassword);

  @override
  List<Object> get props => [newPassword];
}

class ConfirmPasswordChanged extends PasswordEvent {
  final String confirmPassword;

  const ConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}

class PasswordFormSubmitted extends PasswordEvent {
  const PasswordFormSubmitted();
}

class ResetPasswordForm extends PasswordEvent {}