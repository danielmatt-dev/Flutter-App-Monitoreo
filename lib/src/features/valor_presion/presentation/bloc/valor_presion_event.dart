part of 'valor_presion_bloc.dart';

@immutable
sealed class ValorPresionEvent {
  const ValorPresionEvent();
}

// Evento para obtener la lista de valores de la presión del día
class GetListValoresPresion extends ValorPresionEvent {

  final String fecha;

  const GetListValoresPresion({required this.fecha});

}

// Evento para crear la petición del valor de la presión
class CaptureValorPresion extends ValorPresionEvent {

  final int valorSistolica;
  final int valorDiastolica;
  final String medicion;
  final String notas;

  const CaptureValorPresion({
    required this.valorSistolica,
    required this.valorDiastolica,
    required this.medicion,
    required this.notas
  });

}

// Evento para ingresar el valor de la presión
class SaveValorPresion extends ValorPresionEvent {

  final ValorPresionRequest valorPresion;

  const SaveValorPresion({required this.valorPresion});

}
