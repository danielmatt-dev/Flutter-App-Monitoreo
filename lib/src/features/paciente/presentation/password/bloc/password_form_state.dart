part of 'password_bloc.dart';

class PasswordFormState extends Equatable {

  final Password currentPassword;
  final Password newPassword;
  final Password confirmPassword;
  final FormzStatus status;
  final String? error;

  const PasswordFormState({
    this.currentPassword = const Password.pure(),
    this.newPassword = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.status = FormzStatus.pure,
    this.error
  });

  PasswordFormState copyWith({
    Password? currentPassword,
    Password? newPassword,
    Password? confirmPassword,
    FormzStatus? status,
    String? error
  }) {
    return PasswordFormState(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      error: error
    );
  }

  @override
  List<Object?> get props => [currentPassword, newPassword, confirmPassword, status, error];

}