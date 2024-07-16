import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/bloc/validation/valor_glucosa.dart';
import 'package:formz/formz.dart';

class ValorSistolica extends FormzInput<String, ValorValidationError> {

  const ValorSistolica.pure(): super.pure('');
  const ValorSistolica.dirty([super.value = '']): super.dirty();

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

    if(valor < 110 || valor > 190) {
      return ValorValidationError.outOfRange;
    }

    return null;
  }

}