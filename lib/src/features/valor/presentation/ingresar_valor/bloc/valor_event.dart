part of 'valor_bloc.dart';

@immutable
sealed class ValorEvent extends Equatable {
  const ValorEvent();

  @override
  List<Object> get props => [];

}

// Eventos para el formulario de glucosa
class GlucosaChanged extends ValorEvent {
  final String glucosa;
  final String measurement;

  const GlucosaChanged(this.glucosa, this.measurement);

  @override
  List<Object> get props => [glucosa];
}

class SubmitGlucosaForm extends ValorEvent {

  final String medicion;
  final String notas;

  const SubmitGlucosaForm(this.medicion, this.notas);

}

// Eventos para el formulario de presión
class SistolicaChanged extends ValorEvent {
  final String sistolica;

  const SistolicaChanged(this.sistolica);

  @override
  List<Object> get props => [sistolica];
}

class DiastolicaChanged extends ValorEvent {
  final String diastolica;

  const DiastolicaChanged(this.diastolica);

  @override
  List<Object> get props => [diastolica];
}

class SubmitPresionForm extends ValorEvent {

  final String medicion;
  final String notas;

  const SubmitPresionForm(this.medicion, this.notas);
}

// Evento para crear la petición del valor de la glucosa
class SaveValorGlucosaEvent extends ValorEvent {

  final int valor;
  final String medicion;
  final String notas;

  const SaveValorGlucosaEvent({
    required this.valor,
    required this.medicion,
    required this.notas
  });

}

// Evento para crear la petición del valor de la presión
class SaveValorPresionEvent extends ValorEvent {

  final int valorSistolica;
  final int valorDiastolica;
  final String medicion;
  final String notas;

  const SaveValorPresionEvent({
    required this.valorSistolica,
    required this.valorDiastolica,
    required this.medicion,
    required this.notas
  });

}

// Evento para inicializar el formulario
class InitializeForm extends ValorEvent {
  final bool isGlucose;

  const InitializeForm(this.isGlucose);
}