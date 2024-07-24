part of 'paciente_bloc.dart';

@immutable
sealed class PacienteEvent extends Equatable {

  const PacienteEvent();

  @override
  List<Object?> get props => [];

}

//  Evento para buscar al paciente
class BuscarDatosPacienteEvent extends PacienteEvent {

  const BuscarDatosPacienteEvent();

}

// Evento para buscar el usuario y correo
class GetUserAndEmailEvent extends PacienteEvent {}

//  Evento para actualizar los datos del paciente
class ActualizarPacienteEvent extends PacienteEvent {

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
  final String telefono;
  final String correo;


  const ActualizarPacienteEvent({
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
    required this.factorActividad,
    required this.telefono,
    required this.correo
  });

  @override
  List<Object?> get props => [nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento,
  genero, estadoCivil, nivelEstudios, numMiembrosHogar, tipoDiabetes, tiempoDiabetes, peso,
  talla, factorActividad, telefono, correo];

}