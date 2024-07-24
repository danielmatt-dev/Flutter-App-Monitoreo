import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/domain/repositories/pregunta_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarPreguntas extends UseCase<List<Pregunta>, TipoPregunta>{

  final PreguntaRepository repository;

  BuscarPreguntas(this.repository);

  @override
  Future<Either<Exception, List<Pregunta>>> call(TipoPregunta params) async =>
      await repository.buscarPreguntas(params);

}

// <>