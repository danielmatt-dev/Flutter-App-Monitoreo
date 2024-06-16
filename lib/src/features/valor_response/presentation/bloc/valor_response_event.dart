part of 'valor_response_bloc.dart';

@immutable
sealed class ValorResponseEvent extends Equatable {

  const ValorResponseEvent();

  @override
  List<Object?> get props => [];

}

// Evento para obtener la lista de valores de la presión del día
class GetListValores extends ValorResponseEvent {

  final String fecha;

  const GetListValores({required this.fecha});

  @override
  List<Object?> get props => [fecha];

}

// <>