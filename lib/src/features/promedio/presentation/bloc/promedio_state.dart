part of 'promedio_bloc.dart';

@immutable
sealed class PromedioState extends Equatable {

  const PromedioState();

  @override
  List<Object?> get props => [];

}

// Estado inicial
class AverageInicial extends PromedioState {}

// Cargando datos
class AverageLoading extends PromedioState {}

// Lista de promedios cargada
class AverageListSuccess extends PromedioState {

  final List<Promedio> promedios;

  const AverageListSuccess(this.promedios);

  @override
  List<Object?> get props => [promedios];

}

// Error al cargar promedios
class AverageError extends PromedioState {

  final String error;

  const AverageError(this.error);

  @override
  List<Object?> get props => [error];

}