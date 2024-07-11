part of 'valor_bloc.dart';

@immutable
sealed class ValorGlucosaEvent{
  const ValorGlucosaEvent();
}

// Evento para crear la petición del valor de la glucosa
class SaveValorGlucosaEvent extends ValorGlucosaEvent {

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
class SaveValorPresionEvent extends ValorGlucosaEvent {

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