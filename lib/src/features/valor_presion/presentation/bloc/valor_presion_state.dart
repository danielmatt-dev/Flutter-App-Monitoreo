part of 'valor_presion_bloc.dart';

// <>
@immutable
sealed class ValorPresionState {
  const ValorPresionState();
}

// Estado inicial
class ValorPresionInicial extends ValorPresionState {}

// Cargando valores
class ValorPresionLoading extends ValorPresionState {}

// Lista de valores cargados
class ValorPresionGetListSuccess extends ValorPresionState {

  final List<ValorPresionResponse> valores;

  const ValorPresionGetListSuccess({required this.valores});

}

// Valor Presión creado
class ValorPresionCreateSuccess extends ValorPresionState {

  final ValorPresionRequest valorPresion;

  const ValorPresionCreateSuccess({required this.valorPresion});

}

// Valor Presión guardado
class ValorPresionSaveSuccess extends ValorPresionState {

  final bool success;

  const ValorPresionSaveSuccess({required this.success});

}

// Promedio de la sistolica
class ValorPresionAverageSistolicaSuccess extends ValorPresionState {

  final double promedioSistolica;

  const ValorPresionAverageSistolicaSuccess({required this.promedioSistolica});

}

// Promedio de la diastolica
class ValorPresionAverageDiastolicaSuccess extends ValorPresionState {

  final double promedioDiastolica;

  const ValorPresionAverageDiastolicaSuccess({required this.promedioDiastolica});

}

// Error al cargar valores
class ValorPresionError extends ValorPresionState {

  final String error;

  const ValorPresionError({required this.error});

}