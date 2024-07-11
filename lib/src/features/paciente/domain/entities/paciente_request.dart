import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';

class PacienteRequest {

  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String fechaNacimiento;
  final String genero;
  final String estadoCivil;
  final String nivelEstudios;
  final int numMiembrosHogar;
  final String tipoDiabetes;
  final String tiempoDiabetes;
  final double peso;
  final double talla;
  final String telefono;
  final String correo;
  final String password;
  final String factorActividad;
  final String claveDoctor;
  final String nombreTratamiento;
  final RegistroRespuestas sensacionCorporal;
  final RegistroRespuestas visionBorrosa;

  PacienteRequest({
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
    required this.telefono,
    required this.correo,
    required this.password,
    required this.factorActividad,
    required this.claveDoctor,
    required this.nombreTratamiento,
    required this.sensacionCorporal,
    required this.visionBorrosa
  });

}