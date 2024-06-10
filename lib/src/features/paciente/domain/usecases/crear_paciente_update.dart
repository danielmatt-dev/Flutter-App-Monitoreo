import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_update_request.dart';
import 'package:equatable/equatable.dart';

class CrearPacienteUpdate {

  PacienteUpdateRequest call(CrearPacienteUpdateParams params) =>
      PacienteUpdateRequest(
          folio: 0,
          nombre: params.nombre,
          apellidoPaterno: params.apellidoPaterno,
          apellidoMaterno: params.apellidoMaterno,
          fechaNacimiento: params.fechaNacimiento,
          genero: params.genero,
          estadoCivil: params.estadoCivil,
          nivelEstudios: params.nivelEstudios,
          numMiembrosHogar: params.numMiembrosHogar,
          tipoDiabetes: params.tipoDiabetes,
          tiempoDiabetes: params.tiempoDiabetes,
          peso: params.peso,
          talla: params.talla,
          factorActividad: params.factorActividad
      );

}

class CrearPacienteUpdateParams extends Equatable {

  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final DateTime fechaNacimiento;
  final String genero;
  final String estadoCivil;
  final String nivelEstudios;
  final int numMiembrosHogar;
  final String tipoDiabetes;
  final String tiempoDiabetes;
  final double peso;
  final double talla;
  final String factorActividad;

  const CrearPacienteUpdateParams({
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.fechaNacimiento,
    required this.genero,
    required this.estadoCivil,
    required this.nivelEstudios,
    required this.numMiembrosHogar,
    required this.tipoDiabetes,
    required this.tiempoDiabetes,
    required this.peso,
    required this.talla,
    required this.factorActividad
  });

  @override
  List<Object?> get props => [nombre, apellidoPaterno, apellidoMaterno,
    fechaNacimiento, genero, estadoCivil, nivelEstudios, numMiembrosHogar,
    tipoDiabetes, tiempoDiabetes, peso, talla, factorActividad];

}