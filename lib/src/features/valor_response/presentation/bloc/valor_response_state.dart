part of 'valor_response_bloc.dart';

@immutable
sealed class ValorResponseState { const ValorResponseState(); }

// Estado inicial
class ValorResponseInicial extends ValorResponseState {}

// Cargando valores
class ValorResponseLoading extends ValorResponseState {}

// Lista de valores cargados
class ValorGetListSuccess extends ValorResponseState {

  final List<ValorResponse> valoresGlucosa;
  final List<ValorResponse> valoresPresion;

  const ValorGetListSuccess({
    required this.valoresGlucosa,
    required this.valoresPresion
  });

}

// Error al cargar valores
class ValorResponseError extends ValorResponseState {

  final String error;

  const ValorResponseError({required this.error});

}
