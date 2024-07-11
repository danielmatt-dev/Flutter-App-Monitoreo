import 'package:app_plataforma/src/features/valor/data/models/valor_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'valor_presion_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ValorPresionRequestModel extends ValorRequestModel {

  final int valorSistolica;
  final int valorDiastolica;

  ValorPresionRequestModel({
    required this.valorSistolica,
    required this.valorDiastolica,
    required super.medicion,
    required super.notas,
  });

  factory ValorPresionRequestModel.fromJson(Map<String, dynamic> json) => _$ValorPresionRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValorPresionRequestModelToJson(this);

}

// <>