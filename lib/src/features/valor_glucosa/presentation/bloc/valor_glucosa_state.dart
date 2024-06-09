part of 'valor_glucosa_bloc.dart';

@immutable
sealed class ValorGlucosaState {
  const ValorGlucosaState();
}

// Estado inicial
class ValorGlucosaInicial extends ValorGlucosaState {}

// Cargando valores
class ValorGlucosaLoading extends ValorGlucosaState {}

// Valores cargados
class ValorGlucosaGetListSuccess extends ValorGlucosaState {

  final List<ValorGlucosaResponse> valores;

  const ValorGlucosaGetListSuccess({required this.valores});

}

// Valor creado
class ValorGlucosaCreateSuccess extends ValorGlucosaState {

  final ValorGlucosaRequest valorGlucosa;

  const ValorGlucosaCreateSuccess({required this.valorGlucosa});

}

// Valor guardado
class ValorGlucosaSaveSuccess extends ValorGlucosaState {

  final bool success;

  const ValorGlucosaSaveSuccess({required this.success});

}

// Promedio de la glucosa
class ValorGlucosaAverageSuccess extends ValorGlucosaState {

  final double promedio;

  const ValorGlucosaAverageSuccess({required this.promedio});

}

// Error al cargar valores
class ValorGlucosaError extends ValorGlucosaState{

  final String error;

  const ValorGlucosaError({required this.error});

}

// <>