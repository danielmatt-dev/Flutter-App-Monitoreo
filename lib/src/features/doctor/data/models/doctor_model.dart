import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DoctorModel {

  final String clave;
  final String nombre;
  @JsonKey(name: 'apellido_paterno')
  final String apellidoPaterno;
  @JsonKey(name: 'apellido_materno')
  final String apellidoMaterno;
  @JsonKey(name: 'fecha_nacimiento')
  final DateTime fechaNacimiento;
  final String genero;
  final String telefono;
  final String especialidad;
  @JsonKey(name: 'cedula_profesional')
  final String cedulaProfesional;
  final String correo;

  DoctorModel({
    required this.clave,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.fechaNacimiento,
    required this.genero,
    required this.telefono,
    required this.especialidad,
    required this.cedulaProfesional,
    required this.correo,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);

}