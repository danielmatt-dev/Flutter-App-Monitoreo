import 'package:app_plataforma/src/features/paciente/presentation/password/bloc/validation/password_validation.dart';
import 'package:formz/formz.dart';

class ConfirmPassword extends FormzInput<String, PasswordValidationError> {

  final String password;

  const ConfirmPassword.pure({this.password = ''}) : super.pure('');
  const ConfirmPassword.dirty({required this.password, String value = ''}) :
      super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if(value.isEmpty) {
      return PasswordValidationError.empty;
    }

    if(value != password) {
      return PasswordValidationError.mismatch;
    }

    return null;
  }

}