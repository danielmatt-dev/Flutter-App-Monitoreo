import 'package:freezed_annotation/freezed_annotation.dart';

part 'comentario_model.g.dart';

// <>
@JsonSerializable(fieldRename: FieldRename.snake)
class ComentarioModel {

  final int folio;
  final String descripcion;

  ComentarioModel({
    required this.folio,
    required this.descripcion
  });

  factory ComentarioModel.fromJson(Map<String, dynamic> json) => _$ComentarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComentarioModelToJson(this);

}