part of 'promedio_bloc.dart';

@immutable
sealed class PromedioState { const PromedioState(); }

class AverageInicial extends PromedioState {}

class AverageLoading extends PromedioState {}

class AverageListSuccess extends PromedioState {

  final List<Promedio> promedios;

  const AverageListSuccess(this.promedios);

}

class AverageError extends PromedioState {

  final String error;

  const AverageError(this.error);

}