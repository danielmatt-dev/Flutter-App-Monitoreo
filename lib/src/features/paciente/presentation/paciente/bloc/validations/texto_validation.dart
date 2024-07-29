import 'package:formz/formz.dart';

enum TextoValidationError { empty, tooLong, invalidFormat }

// <>
class Texto extends FormzInput<String, TextoValidationError> {

  const Texto.pure() : super.pure('');
  const Texto.dirty([super.value = '']) : super.dirty();

  static final _textoRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
  //static final _textoRegex = RegExp(r'^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$');

  @override
  TextoValidationError? validator(String value) {

    if(value.isEmpty){
      return TextoValidationError.empty;
    }

    if(value.length > 50) {
      return TextoValidationError.tooLong;
    }

    if (!_textoRegex.hasMatch(value)) {
      return TextoValidationError.invalidFormat;
    }

    return null;
  }

}