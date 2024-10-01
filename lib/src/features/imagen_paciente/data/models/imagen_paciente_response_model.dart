import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'imagen_paciente_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImagenPacienteResponseModel extends ImagenPacienteResponse {

  late int folio;

  ImagenPacienteResponseModel({
    required super.url,
    required super.tipoImagen,
    required super.fecha,
    required super.hora
  });

  factory ImagenPacienteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ImagenPacienteResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagenPacienteResponseModelToJson(this);

}