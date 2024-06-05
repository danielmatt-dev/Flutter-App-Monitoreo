part of 'valor_glucosa_bloc.dart';

abstract class ValorGlucosaEvent{
  const ValorGlucosaEvent();
}

// Evento para obtener los valores dependiendo del día
class GetValoresGlucosa extends ValorGlucosaEvent {

  final int folio;
  final String fecha;

  GetValoresGlucosa({required this.folio, required this.fecha});

}

// Evento para crear la petición del valor glucosa
class CaptureValorGlucosa extends ValorGlucosaEvent {

  final String idPaciente;
  final int valor;
  final String medicion;
  final String notas;

  CaptureValorGlucosa({
    required this.idPaciente,
    required this.valor,
    required this.medicion,
    required this.notas
  });

}

// Evento para ingresar el valor de la glucosa
class SaveValorGlucosa extends ValorGlucosaEvent {

  final ValorGlucosaRequest valorGlucosa;

  SaveValorGlucosa(this.valorGlucosa);

}
