part of 'direccion_bloc.dart';

@immutable
sealed class DireccionState extends Equatable {

  const DireccionState();

  @override
  List<Object> get props => [];

}

class DireccionFormState extends Equatable {
  final CodePostal codePostal;
  final List<String> colonias;
  final String ciudad;
  final String estado;
  final String pais;
  final FormzStatus status;
  final String errorMessage;

  const DireccionFormState({
    this.codePostal = const CodePostal.pure(),
    this.colonias = const [],
    this.ciudad = '',
    this.estado = '',
    this.pais = '',
    this.status = FormzStatus.pure,
    this.errorMessage = '',
  });

  DireccionFormState copyWith({
    CodePostal? codePostal,
    List<String>? colonias,
    String? ciudad,
    String? estado,
    String? pais,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return DireccionFormState(
      codePostal: codePostal ?? this.codePostal,
      colonias: colonias ?? this.colonias,
      ciudad: ciudad ?? this.ciudad,
      estado: estado ?? this.estado,
      pais: pais ?? this.pais,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    codePostal,
    colonias,
    ciudad,
    estado,
    pais,
    status,
    errorMessage,
  ];
}

/*

class ActualizarDireccionState extends DireccionState {}

class BuscarDireccionState extends DireccionState {

  final DireccionResponse direccion;

  const BuscarDireccionState(this.direccion);

  @override
  List<Object> get props => [direccion];

}

class DireccionErrorState extends DireccionState {}

 */