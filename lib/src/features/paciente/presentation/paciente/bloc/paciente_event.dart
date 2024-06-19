part of 'paciente_bloc.dart';

@immutable
sealed class PacienteEvent extends Equatable {

  const PacienteEvent();

  @override
  List<Object?> get props => [];

}

//  Evento para buscar al paciente por id
class BuscarDatosPacienteEvent extends PacienteEvent {

  const BuscarDatosPacienteEvent();

}

//  Evento para actualizar la contraseña del paciente
class ActualizarPasswordEvent extends PacienteEvent {

  final String currentPassword;
  final String newPassword;

  const ActualizarPasswordEvent({required this.currentPassword, required this.newPassword});

  @override
  List<Object?> get props => [currentPassword, newPassword];

}