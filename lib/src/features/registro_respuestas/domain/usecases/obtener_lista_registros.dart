import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/repositories/registro_respuestas_repository.dart';

class ObtenerListaRegistros {

  final RegistroRespuestasRepository repository;

  const ObtenerListaRegistros({required this.repository});

  List<RegistroRespuestas> call() => repository.getRespuestas();

}