import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {

  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {

    if (value == null) {
      return null;
    }

    return EmailValidator.validate(value)
        ? null
        : EmailValidationError.invalid;
  }

}