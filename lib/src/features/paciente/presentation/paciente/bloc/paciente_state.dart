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

  final Map<String, String> mapContacto;
  final Map<String, String> mapFichaTecnica;
  final Map<String, String> mapSomatometria;
  final Map<String, String> mapFichaMedica;
  final Map<String, String> mapDoctor;
  final Map<String, String> mapData;

  const PacienteSuccess(
      this.mapContacto,
      this.mapFichaTecnica,
      this.mapSomatometria,
      this.mapFichaMedica,
      this.mapDoctor,
      this.mapData
      );

  @override
  List<Object?> get props => [
    mapContacto,
    mapFichaTecnica,
    mapSomatometria,
    mapFichaMedica,
    mapDoctor,
    mapData
  ];

}

class UserAndEmailSuccess extends PacienteState {

  final String usuario;
  final String correo;

  const UserAndEmailSuccess(this.usuario, this.correo);

  @override
  List<Object?> get props => [usuario, correo];

}

//
class SignUpSuccess extends PacienteState {}

// Paciente Actualizado
class PacienteUpdateSuccess extends PacienteState {}

// Error al cargar al paciente
class PacienteError extends PacienteState {

  final String error;

  const PacienteError(this.error);

  @override
  List<Object?> get props => [error];

}
