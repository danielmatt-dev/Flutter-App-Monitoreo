part of 'paciente_bloc.dart';

@immutable
sealed class PacienteEvent extends Equatable {

  const PacienteEvent();

  @override
  List<Object?> get props => [];

}

//  Evento para buscar al paciente por id
class BuscarDatosPaciente extends PacienteEvent {

  const BuscarDatosPaciente();

}
