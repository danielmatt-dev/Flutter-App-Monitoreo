import 'package:json_annotation/json_annotation.dart';

part 'valor_glucosa_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ValorGlucosaRequestModel {

  @JsonKey(name: "id_paciente")
  final String idPaciente;
  final int valor;
  final String medicion;
  final String notas;

  ValorGlucosaRequestModel({
    required this.idPaciente,
    required this.valor,
    required this.medicion,
    required this.notas
  });

  factory ValorGlucosaRequestModel.fromJson(Map<String, dynamic> json) => _$ValorGlucosaRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValorGlucosaRequestModelToJson(this);

}
