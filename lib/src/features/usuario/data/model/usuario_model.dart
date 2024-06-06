import 'package:json_annotation/json_annotation.dart';

part 'usuario_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UsuarioModel {

  @JsonKey(name: 'id_paciente')
  final String idPaciente;
  final String correo;
  final String password;
  final String rol;

  UsuarioModel({
    required this.idPaciente,
    required this.correo,
    required this.password,
    required this.rol
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => _$UsuarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioModelToJson(this);

}

// <>