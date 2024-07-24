import 'package:app_plataforma/src/features/preguntas/data/models/pregunta_model.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:dartz/dartz.dart';

abstract class PreguntaRemoteDatasource {

  Future<Either<Exception, List<PreguntaModel>>> buscarPreguntas(TipoPregunta tipoPregunta);

}

// <>