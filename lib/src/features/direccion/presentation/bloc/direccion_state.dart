part of 'direccion_bloc.dart';

class DireccionFormState extends Equatable {
  final CodePostal codePostal;
  final Map<String, String> colonias;
  final String asentamiento;
  final String calle;
  final String numero;
  final String entreCalleUno;
  final String entreCalleDos;
  final String ciudad;
  final String estado;
  final String pais;
  final FormzStatus status;
  final String errorMessage;

  const DireccionFormState({
    this.codePostal = const CodePostal.pure(),
    this.colonias = const {},
    this.asentamiento = '',
    this.calle = '',
    this.numero = '',
    this.entreCalleUno = '',
    this.entreCalleDos = '',
    this.ciudad = '',
    this.estado = '',
    this.pais = '',
    this.status = FormzStatus.pure,
    this.errorMessage = '',
  });

  DireccionFormState copyWith({
    CodePostal? codePostal,
    Map<String, String>? colonias,
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
    asentamiento,
    calle,
    numero,
    entreCalleUno,
    entreCalleDos,
    ciudad,
    estado,
    pais,
    status,
    errorMessage,
  ];

}