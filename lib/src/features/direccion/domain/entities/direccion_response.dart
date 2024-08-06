
class DireccionResponse {

  final String codigoPostal;
  final Map<String, String> colonias;
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
