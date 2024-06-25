
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

class ActualizarDireccionEvent extends DireccionEvent {

  final String colonia;
  final String codigoPostal;
  final String ciudad;
  final String estado;
  final String pais;

  const ActualizarDireccionEvent({
    required this.colonia,
    required this.codigoPostal,
    required this.ciudad,
    required this.estado,
    required this.pais
  });

  @override
  List<Object> get props => [colonia, codigoPostal, ciudad, estado, pais];
}

/*

class SearchDireccion extends DireccionEvent {

  final String codePostal;

  const SearchDireccion(this.codePostal);

  @override
  List<Object> get props => [codePostal];

}

class UpdateDireccion extends DireccionEvent {

  final String colonia;
  final String codigoPostal;
  final String ciudad;
  final String estado;
  final String pais;

  const UpdateDireccion({
    required this.colonia,
    required this.codigoPostal,
    required this.ciudad,
    required this.estado,
    required this.pais
  });

  @override
  List<Object> get props => [colonia, codigoPostal, ciudad, estado, pais];

}

 */