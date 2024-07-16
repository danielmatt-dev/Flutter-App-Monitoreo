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
  final bool showErrorMessages;

  const GlucosaFormState({
    this.valorGlucosa = const ValorGlucosa.pure(),
    this.status = FormzStatus.pure,
    this.error,
    this.showErrorMessages = false,
  });

  GlucosaFormState copyWith({
    ValorGlucosa? valorGlucosa,
    FormzStatus? status,
    String? error,
    bool? showErrorMessages,
  }) {
    return GlucosaFormState(
      valorGlucosa: valorGlucosa ?? this.valorGlucosa,
      status: status ?? this.status,
      error: error,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
    );
  }

  @override
  List<Object?> get props => [valorGlucosa, status, error, showErrorMessages];
}

class PresionFormState extends ValorState {
  final ValorSistolica valorSistolica;
  final ValorDiastolica valorDiastolica;
  final FormzStatus status;
  final String? error;
  final bool showErrorMessages;

  const PresionFormState({
    this.valorSistolica = const ValorSistolica.pure(),
    this.valorDiastolica = const ValorDiastolica.pure(),
    this.status = FormzStatus.pure,
    this.error,
    this.showErrorMessages = false,
  });

  PresionFormState copyWith({
    ValorSistolica? valorSistolica,
    ValorDiastolica? valorDiastolica,
    FormzStatus? status,
    String? error,
    bool? showErrorMessages,
  }) {
    return PresionFormState(
      valorSistolica: valorSistolica ?? this.valorSistolica,
      valorDiastolica: valorDiastolica ?? this.valorDiastolica,
      status: status ?? this.status,
      error: error,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
    );
  }

  @override
  List<Object?> get props => [valorSistolica, valorDiastolica, status, error, showErrorMessages];
}

class ValorSaveSuccess extends ValorState {}

// <>