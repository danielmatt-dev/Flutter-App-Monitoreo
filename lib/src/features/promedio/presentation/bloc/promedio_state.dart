part of 'promedio_bloc.dart';

@immutable
sealed class PromedioState { const PromedioState(); }

class AverageInicial extends PromedioState {}

class AverageLoading extends PromedioState {}

class AverageSuccess extends PromedioState {

  final Promedio promedio;

  const AverageSuccess(this.promedio);

}

class AverageError extends PromedioState {

  final String error;

  const AverageError(this.error);

}