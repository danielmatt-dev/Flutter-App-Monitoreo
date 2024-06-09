import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';

class ObtenerListaRegistros {

  final List<RegistroRespuestas> respuestas;

  const ObtenerListaRegistros({required this.respuestas});

  List<RegistroRespuestas> call() => respuestas;

}