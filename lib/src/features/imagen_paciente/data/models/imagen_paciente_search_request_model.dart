import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_search_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'imagen_paciente_search_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImagenPacienteSearchRequestModel extends ImagenPacienteSearchRequest {

  late int folio;

  ImagenPacienteSearchRequestModel({
    required super.tipoBusqueda,
    super.regionCuerpo,
    super.fechaInicio,
    super.fechaFin
  });

  factory ImagenPacienteSearchRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ImagenPacienteSearchResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagenPacienteSearchResponseModelToJson(this);

}