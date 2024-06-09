import 'package:app_plataforma/src/features/preguntas/data/data_sources/remote/pregunta_remote_datasource.dart';
import 'package:app_plataforma/src/features/preguntas/data/models/mapper/pregunta_mapper.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/domain/repositories/pregunta_repository.dart';
import 'package:dartz/dartz.dart';

class PreguntaAdapter extends PreguntaRepository {

  final PreguntaRemoteDatasource remote;
  final PreguntaMapper mapper;

  PreguntaAdapter({required this.remote, required this.mapper});

  @override
  Future<Either<Exception, List<Pregunta>>> buscarPreguntas() async {

    final response = await remote.buscarPreguntas();

    return response.fold(
            (failure) => Left(failure),
            (models) => Right(mapper.toListaPreguntas(models))
    );

  }

}