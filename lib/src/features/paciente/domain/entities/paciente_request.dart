class PacienteRequest {

  final int folio;
  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final DateTime fechaNacimiento;
  final String genero;
  final String estadoCivil;
  final String nivelEstudios;
  final int numMiembrosHogar;
  final String tipoDiabetes;
  final String tiempoDiabetes;
  final double peso;
  final double talla;
  final String correo;
  final String password;
  final String factorActividad;
  final String claveDoctor;
  final String nombreTratamiento;

  PacienteRequest({
    required this.folio,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.fechaNacimiento,
    required this.genero,
    required this.estadoCivil,
    required this.nivelEstudios,
    required this.numMiembrosHogar,
    required this.tipoDiabetes,
    required this.tiempoDiabetes,
    required this.peso,
    required this.talla,
    required this.correo,
    required this.password,
    required this.factorActividad,
    required this.claveDoctor,
    required this.nombreTratamiento
  });

}