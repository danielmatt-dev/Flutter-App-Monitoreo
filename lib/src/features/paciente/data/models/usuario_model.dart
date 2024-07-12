import 'package:json_annotation/json_annotation.dart';

part 'usuario_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UsuarioModel {

  late String id;
  final String correo;
  final String password;

  UsuarioModel({
    required this.correo,
    required this.password,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => _$UsuarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioModelToJson(this);

}

// <>