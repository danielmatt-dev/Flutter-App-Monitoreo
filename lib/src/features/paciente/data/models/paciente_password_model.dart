import 'package:json_annotation/json_annotation.dart';

part 'paciente_password_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PacientePasswordModel {

  @JsonKey(name: "id")
  late String idPaciente;
  final String currentPassword;
  final String newPassword;

  PacientePasswordModel({
    required this.currentPassword,
    required this.newPassword
  });

  factory PacientePasswordModel.fromJson(Map<String, dynamic> json) => _$PacientePasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$PacientePasswordModelToJson(this);

}