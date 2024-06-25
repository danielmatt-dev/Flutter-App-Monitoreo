import 'package:formz/formz.dart';

enum CodePostalValidationError { empty, invalidFormat }

// <>
class CodePostal extends FormzInput<String, CodePostalValidationError> {

  const CodePostal.pure(): super.pure('');
  const CodePostal.dirty([super.value = '']): super.dirty();

  static final _codePostalRegex = RegExp(r'\d{5}');

  @override
  CodePostalValidationError? validator(String value) {
    if(value.isEmpty) {
      return CodePostalValidationError.empty;
    }

    if(!_codePostalRegex.hasMatch(value)) {
      return CodePostalValidationError.invalidFormat;
    }

    return null;
  }

}