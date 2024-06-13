part of 'valor_response_bloc.dart';

@immutable
sealed class ValorResponseEvent { const ValorResponseEvent(); }

// Evento para obtener la lista de valores de la presión del día
class GetListValoresPresion extends ValorResponseEvent {

  final String fecha;

  const GetListValoresPresion({required this.fecha});

}

// Evento para obtener la lista de valores de la glucosa del día
class GetListValoresGlucosa extends ValorResponseEvent {

  final String fecha;

  const GetListValoresGlucosa({required this.fecha});

}

// <>