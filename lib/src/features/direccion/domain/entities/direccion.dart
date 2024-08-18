
class Direccion {

  late String id;
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

  Direccion({
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

  Map<String, String> toMap(){
    return {
      'Colonia': colonia,
      'Código Postal': codigoPostal,
      'Asentamiento': asentamiento,
      'Calle': calle,
      'Número': numero,
      'Entre Calle (1)': entreCalleUno,
      'Entre Calle (2)': entreCalleDos,
      'Ciudad': ciudad,
      'Estado': estado,
      'País': pais,
    };
  }

}