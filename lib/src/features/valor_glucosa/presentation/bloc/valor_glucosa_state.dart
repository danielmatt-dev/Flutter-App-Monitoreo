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

  ValorGlucosaGetListSuccess(this.valores);

}

// Valor creado
class ValorGlucosaCreateSuccess extends ValorGlucosaState {

  final ValorGlucosaRequest valorGlucosa;

  ValorGlucosaCreateSuccess(this.valorGlucosa);

}

// Valor guardado
class ValorGlucosaSaveSuccess extends ValorGlucosaState {

  final bool success;

  ValorGlucosaSaveSuccess(this.success);

}

// Error al cargar
class ValorGlucosaError extends ValorGlucosaState{

  final String error;

  ValorGlucosaError(this.error);

}

// <>