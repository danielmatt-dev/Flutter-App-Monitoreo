part of 'valor_response_bloc.dart';

@immutable
sealed class ValorResponseEvent { const ValorResponseEvent(); }

// Evento para obtener la lista de valores de la presión del día
class GetListValores extends ValorResponseEvent {

  final String fecha;

  const GetListValores({required this.fecha});

}

// <>