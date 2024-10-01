import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'imagen_paciente_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImagenPacienteRequestModel extends ImagenPacienteRequest {

  late int folio;

  ImagenPacienteRequestModel({
    required super.tipoImagen,
    required super.imagen,
    required super.fecha,
    required super.hora
  });

  factory ImagenPacienteRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ImagenPacienteRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagenPacienteRequestModelToJson(this);

}