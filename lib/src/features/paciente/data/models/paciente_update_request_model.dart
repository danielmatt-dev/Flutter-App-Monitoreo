import 'package:json_annotation/json_annotation.dart';

part 'paciente_update_request_model.g.dart';

//
@JsonSerializable(fieldRename: FieldRename.snake)
class PacienteUpdateRequestModel {

  late final int folio;
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
  final String factorActividad;

  PacienteUpdateRequestModel({
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
    required this.factorActividad
  });

  factory PacienteUpdateRequestModel.fromJson(Map<String, dynamic> json) => _$PacienteUpdateRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PacienteUpdateRequestModelToJson(this);

}