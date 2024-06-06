part of 'paciente_bloc.dart';

class PacienteEvent {

  const PacienteEvent();

}

//  Evento para buscar al paciente por id
class ObtenerPacientePorId extends PacienteEvent {

  final String id;

  ObtenerPacientePorId(this.id);

}
