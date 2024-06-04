part of 'paciente_bloc.dart';

class PacienteState {

  const PacienteState();

}

// Estado inicial
class PacienteInicial extends PacienteState {}

// Cargando Paciente
class PacienteLoading extends PacienteState {}

// Paciente por id cargado
class PacienteSuccess extends PacienteState {

  final Paciente paciente;

  PacienteSuccess(this.paciente);

}

// Error al cargar al paciente
class PacienteError extends PacienteState {

  final String error;

  PacienteError(this.error);

}