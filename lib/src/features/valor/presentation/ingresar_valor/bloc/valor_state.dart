part of 'valor_bloc.dart';

@immutable
sealed class ValorGlucosaState {
  const ValorGlucosaState();
}

// Estado inicial
class ValorGlucosaInicial extends ValorGlucosaState {}

// Cargando valores
class ValorGlucosaLoading extends ValorGlucosaState {}

// Valor de la gluosa guardado
class ValorGlucosaSaveSuccess extends ValorGlucosaState {}

// Valor de la presion guardado
class ValorPresionSaveSuccess extends ValorGlucosaState {}

// Error al cargar valores
class ValorGlucosaError extends ValorGlucosaState{

  final String error;

  const ValorGlucosaError({required this.error});

}

// <>