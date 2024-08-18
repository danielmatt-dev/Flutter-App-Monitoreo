
part of 'direccion_bloc.dart';

@immutable
sealed class DireccionEvent extends Equatable {
  const DireccionEvent();

  @override
  List<Object> get props => [];

}

class CodePostalChanged extends DireccionEvent {

  final String codePostal;

  const CodePostalChanged(this.codePostal);

  @override
  List<Object> get props => [codePostal];

}

class ColoniaSelected extends DireccionEvent {
  final String colonia;

  const ColoniaSelected(this.colonia);

  @override
  List<Object> get props => [colonia];
}

class BuscarDireccion extends DireccionEvent {

  final String codePostal;

  const BuscarDireccion(this.codePostal);

  @override
  List<Object> get props => [codePostal];

}

class BuscarDireccionPacienteEvent extends DireccionEvent {}

class ActualizarDireccionEvent extends DireccionEvent {

  final String colonia;
  final String codigoPostal;
  final String asentamiento;
  final String calle;
  final String numero;
  final String entreCalleUno;
  final String entreCalleDos;
  final String ciudad;
  final String estado;
  final String pais;

  const ActualizarDireccionEvent({
    required this.colonia,
    required this.codigoPostal,
    required this.asentamiento,
    required this.calle,
    required this.numero,
    required this.entreCalleUno,
    required this.entreCalleDos,
    required this.ciudad,
    required this.estado,
    required this.pais
  });

  @override
  List<Object> get props => [colonia, codigoPostal, ciudad, estado, pais];
}
