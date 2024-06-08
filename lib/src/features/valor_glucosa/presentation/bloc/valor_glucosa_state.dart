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

  const ValorGlucosaCreateSuccess(this.valorGlucosa);

}

// Valor guardado
class ValorGlucosaSaveSuccess extends ValorGlucosaState {

  final bool success;

  const ValorGlucosaSaveSuccess(this.success);

}

// Error al cargar valores
class ValorGlucosaError extends ValorGlucosaState{

  final String error;

  const ValorGlucosaError(this.error);

}

// <>