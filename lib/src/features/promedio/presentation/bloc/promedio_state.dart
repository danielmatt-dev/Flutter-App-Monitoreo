part of 'promedio_bloc.dart';

@immutable
sealed class PromedioState extends Equatable {

  const PromedioState();

  @override
  List<Object?> get props => [];

}

class AverageInicial extends PromedioState {}

class AverageLoading extends PromedioState {}

class AverageListSuccess extends PromedioState {

  final List<Promedio> promedios;

  const AverageListSuccess(this.promedios);

  @override
  List<Object?> get props => [promedios];

}

class AverageError extends PromedioState {

  final String error;

  const AverageError(this.error);

  @override
  List<Object?> get props => [error];

}