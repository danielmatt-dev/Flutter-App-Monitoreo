import 'package:app_plataforma/src/features/registro_respuestas/data/models/registro_respuestas_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paciente_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PacienteRequestModel {

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
  final String factorActividad;
  final String telefono;
  final String correo;
  final String password;
  final String claveDoctor;
  final String nombreTratamiento;

  PacienteRequestModel({
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
  });

  factory PacienteRequestModel.fromJson(Map<String, dynamic> json) => _$PacienteRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PacienteRequestModelToJson(this);

}