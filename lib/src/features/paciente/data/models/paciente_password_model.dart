import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PacientePasswordModel {

  final String idPaciente;
  final String hashActual;
  final String hashNuevo;

  PacientePasswordModel({
    required this.idPaciente,
    required this.hashActual,
    required this.hashNuevo
  });

  factory PacientePasswordModel.fromJson(Map<String, dynamic> json) = _$PacientePasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$PacientePasswordModelToJson(this);

}