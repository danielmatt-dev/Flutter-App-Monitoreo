part of 'valor_bloc.dart';

@immutable
sealed class ValorState extends Equatable {
  const ValorState();

  @override
  List<Object?> get props => [];

}

class GlucosaFormState extends ValorState {

  final ValorGlucosa valorGlucosa;
  final FormzStatus status;
  final String? error;

  const GlucosaFormState({
    this.valorGlucosa = const ValorGlucosa.pure(),
    this.status = FormzStatus.pure,
    this.error
  });

  GlucosaFormState copyWith({
    ValorGlucosa? valorGlucosa,
    FormzStatus? status,
    String? error
  }) {
    return GlucosaFormState(
        valorGlucosa: valorGlucosa ?? this.valorGlucosa,
        status: status ?? this.status,
        error: error
    );
  }

  @override
  List<Object?> get props => [valorGlucosa, status, error];

}

class PresionFormState extends ValorState {

  final ValorSistolica valorSistolica;
  final ValorDiastolica valorDiastolica;
  final FormzStatus status;
  final String? error;

  const PresionFormState({
    this.valorSistolica = const ValorSistolica.pure(),
    this.valorDiastolica = const ValorDiastolica.pure(),
    this.status = FormzStatus.pure,
    this.error
  });

  PresionFormState copyWith({
    ValorSistolica? valorSistolica,
    ValorDiastolica? valorDiastolica,
    FormzStatus? status,
    String? error
  }) {
    return PresionFormState(
        valorSistolica: valorSistolica ?? this.valorSistolica,
        valorDiastolica: valorDiastolica ?? this.valorDiastolica,
        status: status ?? this.status,
        error: error
    );
  }

  @override
  List<Object?> get props => [valorSistolica, valorDiastolica, status, error];

}

class ValorGlucosaLoading extends ValorState {}

class ValorSaveSuccess extends ValorState {}

// <>