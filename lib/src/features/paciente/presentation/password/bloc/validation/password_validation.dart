import 'package:formz/formz.dart';

// Posibles errores
enum PasswordValidationError { empty, tooShort, invalidFormat, mismatch }

// <>
class Password extends FormzInput<String, PasswordValidationError> {

  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$'
  );

  @override
  PasswordValidationError? validator(String value) {
    if(value.isEmpty) {
      return PasswordValidationError.empty;
    }

    if(value.length  < 8) {
      return PasswordValidationError.tooShort;
    }

    if(!_passwordRegex.hasMatch(value)){
      return PasswordValidationError.invalidFormat;
    }

    return null;
  }

}