part of 'valor_glucosa_bloc.dart';

abstract class ValorGlucosaEvent{
  const ValorGlucosaEvent();
}

class ObtenerValoresDelDia extends ValorGlucosaEvent {

  final int folio;
  final String fecha;

  ObtenerValoresDelDia({required this.folio, required this.fecha});

}

class CapturarValorGlucosa extends ValorGlucosaEvent {

  final String idPaciente;
  final int valor;
  final String medicion;
  final String notas;

  CapturarValorGlucosa({
    required this.idPaciente,
    required this.valor,
    required this.medicion,
    required this.notas
  });

}

class IngresarValorGlucosa extends ValorGlucosaEvent {

  final ValorGlucosaRequest valorGlucosa;

  IngresarValorGlucosa(this.valorGlucosa);

}
