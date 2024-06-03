class PacienteEvent {

  const PacienteEvent();

}

//  Evento para buscar al paciente por id
class ObtenerPacientePorId extends PacienteEvent {

  final int id;

  ObtenerPacientePorId(this.id);

}
