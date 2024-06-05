part of 'valor_glucosa_bloc.dart';

abstract class ValorGlucosaState{
  const ValorGlucosaState();
}

class ValorGlucosaInicial extends ValorGlucosaState {}

class ValorGlucosaLoading extends ValorGlucosaState {}

class ValoresGlucosaDiaSuccess extends ValorGlucosaState {

  final List<ValorGlucosaResponse> valores;

  ValoresGlucosaDiaSuccess(this.valores);

}

class ValorGlucosaSuccess extends ValorGlucosaState {

  final ValorGlucosaRequest valorGlucosa;

  ValorGlucosaSuccess(this.valorGlucosa);

}

class ValorGlucosaError extends ValorGlucosaState{

  final String error;

  ValorGlucosaError(this.error);

}

// <>