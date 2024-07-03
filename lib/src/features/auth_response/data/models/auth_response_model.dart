import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

// <>
@JsonSerializable()
class AuthResponseModel {

  @JsonKey(name: 'id')
  final String idPaciente;
  final String token;
  @JsonKey(name: "fecha_expiracion")
  final DateTime fechaExpiracion;

  AuthResponseModel({
    required this.idPaciente,
    required this.token,
    required this.fechaExpiracion
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);

}

