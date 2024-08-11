import 'package:formz/formz.dart';

enum ValorValidationError { empty, outOfRange, nonNumeric }

// <>
class ValorGlucosa extends FormzInput<String, ValorValidationError> {

  final String measurement;

  const ValorGlucosa.pure({required this.measurement}) : super.pure('');
  const ValorGlucosa.dirty({required this.measurement, String value = ''}) : super.dirty(value);

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

    int minValue = 0;
    int maxValue = 700;

    if(measurement == '2 horas después de la comida'){
      minValue = 100;
    }

    if(valor < minValue || valor > maxValue) {
      return ValorValidationError.outOfRange;
    }

    return null;
  }

}