part of 'valor_response_bloc.dart';

@immutable
sealed class ValorResponseState extends Equatable {

  const ValorResponseState();

  @override
  List<Object?> get props => [];

}

// Estado inicial
class ValorResponseInicial extends ValorResponseState {

  const ValorResponseInicial();

  @override
  List<Object?> get props => [];

}

// Cargando valores
class ValorResponseLoading extends ValorResponseState {

  const ValorResponseLoading();

  @override
  List<Object?> get props => [];

}

// Lista de valores cargados
class ValorGetListSuccess extends ValorResponseState {

  final List<ValorResponse> valoresGlucosa;
  final List<ValorResponse> valoresPresion;

  const ValorGetListSuccess({
    required this.valoresGlucosa,
    required this.valoresPresion
  });

  @override
  List<Object?> get props => [valoresGlucosa, valoresPresion];

}

// Error al cargar valores
class ValorResponseError extends ValorResponseState {

  final String error;

  const ValorResponseError({required this.error});

  @override
  List<Object?> get props => [error];

}
