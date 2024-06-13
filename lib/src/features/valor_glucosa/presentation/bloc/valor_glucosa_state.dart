part of 'valor_glucosa_bloc.dart';

@immutable
sealed class ValorGlucosaState {
  const ValorGlucosaState();
}

// Estado inicial
class ValorGlucosaInicial extends ValorGlucosaState {}

// Cargando valores
class ValorGlucosaLoading extends ValorGlucosaState {}

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

// Error al cargar valores
class ValorGlucosaError extends ValorGlucosaState{

  final String error;

  const ValorGlucosaError({required this.error});

}

// <>