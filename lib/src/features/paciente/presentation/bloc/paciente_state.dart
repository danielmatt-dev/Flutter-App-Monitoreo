part of 'paciente_bloc.dart';

@immutable
sealed class PacienteState extends Equatable {

  const PacienteState();

  @override
  List<Object?> get props => [];

}

// Estado inicial
class PacienteInicial extends PacienteState {}

// Cargando Paciente
class PacienteLoading extends PacienteState {}

// Paciente por id cargado
class PacienteSuccess extends PacienteState {

  final Map<String, dynamic> mapPaciente;
  final Map<String, dynamic> mapDoctor;

  const PacienteSuccess(this.mapPaciente, this.mapDoctor);

  @override
  List<Object?> get props => [mapPaciente, mapDoctor];

}

// Paciente Actualizado
class PacienteUpdateSuccess extends PacienteState {}

// Error al cargar al paciente
class PacienteError extends PacienteState {

  final String error;

  const PacienteError(this.error);

  @override
  List<Object?> get props => [error];

}
