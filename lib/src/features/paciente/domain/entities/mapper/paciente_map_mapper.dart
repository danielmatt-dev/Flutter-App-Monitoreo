// <>
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_response.dart';

abstract class PacienteMapMapper {

  Map<String, String> toMapPaciente(PacienteResponse response);

  Map<String, String> toMapDoctor(PacienteResponse response);

}