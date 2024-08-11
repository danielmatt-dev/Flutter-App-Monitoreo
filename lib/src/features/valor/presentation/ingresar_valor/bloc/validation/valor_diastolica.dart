import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/bloc/validation/valor_glucosa.dart';
import 'package:formz/formz.dart';

class ValorDiastolica extends FormzInput<String, ValorValidationError> {

  const ValorDiastolica.pure(): super.pure('');

  const ValorDiastolica.dirty([super.value = '']): super.dirty();

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

    if(valor < 50 || valor > 120) {
      return ValorValidationError.outOfRange;
    }

    return null;
  }

}