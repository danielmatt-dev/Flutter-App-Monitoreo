import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:dartz/dartz.dart';

abstract class PreguntaRepository {

  Future<Either<Exception, List<Pregunta>>> buscarPreguntas(TipoPregunta tipoPregunta);

}

// <>