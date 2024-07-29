import 'package:formz/formz.dart';

enum ClaveValidationError { isEmpty, invalidFormat }

// <>
class Clave extends FormzInput<String, ClaveValidationError> {

  const Clave.pure(): super.pure('');
  const Clave.dirty([super.value = '']) : super.dirty();

  static final _claveRegex = RegExp(r'^[A-Z]{3}-[0-9]{4}$');

  @override
  ClaveValidationError? validator(String value) {

    if(value.isEmpty){
      return ClaveValidationError.isEmpty;
    }

    if(!_claveRegex.hasMatch(value)){
      return ClaveValidationError.invalidFormat;
    }

    return null;
  }

}