import 'package:formz/formz.dart';

enum ValorValidationError { empty, outOfRange, nonNumeric }

// <>
class ValorGlucosa extends FormzInput<String, ValorValidationError> {

  const ValorGlucosa.pure(): super.pure('');
  const ValorGlucosa.dirty([super.value = '']): super.dirty();

  static final _numericRegex = RegExp(r'^\d+$');

  @override
  ValorValidationError? validator(String value) {
    if(value.isEmpty){
      return ValorValidationError.empty;
    }

    if(!_numericRegex.hasMatch(value)){
      return ValorValidationError.nonNumeric;
    }

    final valor = int.parse(value);

    if(valor < 60 || valor > 130) {
      return ValorValidationError.outOfRange;
    }

    return null;
  }

}