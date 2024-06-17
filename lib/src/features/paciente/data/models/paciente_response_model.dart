import 'package:json_annotation/json_annotation.dart';

part 'paciente_response_model.g.dart';

// <>
@JsonSerializable(fieldRename: FieldRename.snake)
class PacienteResponseModel {

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
  final double imc;
  final double rmd;
  final String correo;
  final String nombreTratamiento;
  final String tipoTratamiento;
  final String claveDoctor;
  final String nombreDoctor;
  final String especialidadDoctor;
  final String telefonoDoctor;
  final String correoDoctor;

  PacienteResponseModel({
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
    required this.imc,
    required this.rmd,
    required this.correo,
    required this.nombreTratamiento,
    required this.tipoTratamiento,
    required this.claveDoctor,
    required this.nombreDoctor,
    required this.especialidadDoctor,
    required this.telefonoDoctor,
    required this.correoDoctor
  });

  factory PacienteResponseModel.fromJson(Map<String, dynamic> json) => _$PacienteResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PacienteResponseModelToJson(this);

}