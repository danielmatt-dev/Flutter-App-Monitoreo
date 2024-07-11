import 'package:app_plataforma/src/features/valor/data/models/valor_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'valor_glucosa_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ValorGlucosaRequestModel extends ValorRequestModel {

  final int valor;

  ValorGlucosaRequestModel({
    required this.valor,
    required super.medicion,
    required super.notas,
  });

  factory ValorGlucosaRequestModel.fromJson(Map<String, dynamic> json) => _$ValorGlucosaRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValorGlucosaRequestModelToJson(this);

}
