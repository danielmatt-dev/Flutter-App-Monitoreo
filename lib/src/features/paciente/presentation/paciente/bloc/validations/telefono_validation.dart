import 'package:formz/formz.dart';

enum TelefonoValidationError { empty, nonNumeric }

// <>
class Telefono extends FormzInput<String, TelefonoValidationError> {

  const Telefono.pure() : super.pure('');
  const Telefono.dirty([super.value = '']) : super.dirty();

  static final _telefonoRegex = RegExp(r'\d{10}');

  @override
  TelefonoValidationError? validator(String value) {

    if(value.isEmpty){
      return TelefonoValidationError.empty;
    }

    if(!_telefonoRegex.hasMatch(value)){
      return TelefonoValidationError.nonNumeric;
    }

    return null;
  }

}