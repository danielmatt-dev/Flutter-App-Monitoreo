part of 'valor_glucosa_bloc.dart';

@immutable
sealed class ValorGlucosaEvent{
  const ValorGlucosaEvent();
}

// Evento para crear la petición del valor de la glucosa
class CaptureValorGlucosa extends ValorGlucosaEvent {

  final int valor;
  final String medicion;
  final String notas;

  const CaptureValorGlucosa({
    required this.valor,
    required this.medicion,
    required this.notas
  });

}

// Evento para ingresar el valor de la glucosa
class SaveValorGlucosa extends ValorGlucosaEvent {

  final ValorGlucosaRequest valorGlucosa;

  const SaveValorGlucosa({required this.valorGlucosa});

}

// Evento para buscar el promedio de la glucosa
class AverageValorGlucosa extends ValorGlucosaEvent {

  const AverageValorGlucosa();

}