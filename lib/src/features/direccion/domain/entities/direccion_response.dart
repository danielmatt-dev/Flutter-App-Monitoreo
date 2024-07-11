
class DireccionResponse {

  final String codigoPostal;
  final List<ColoniaResponse> colonias;
  final String ciudad;
  final String estado;
  final String pais;

  DireccionResponse({
    required this.colonias,
    required this.codigoPostal,
    required this.ciudad,
    required this.estado,
    required this.pais
  });

}

class ColoniaResponse {

  final String nombre;
  final String tipo;

  ColoniaResponse({
    required this.nombre,
    required this.tipo
  });

}