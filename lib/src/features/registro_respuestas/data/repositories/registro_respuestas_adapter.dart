import 'package:app_plataforma/src/features/registro_respuestas/data/data_sources/local/registro_respuestas_local_datasource.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/data_sources/remote/registro_respuestas_remote_datasource.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/models/registro_respuestas_model.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/repositories/registro_respuestas_repository.dart';
import 'package:dartz/dartz.dart';

class RegistroRespuestasAdapter extends RegistroRespuestasRepository {

  final RegistroRespuestasRemoteDatasource remote;
  final RegistroRespuestasLocalDatasource local;

  RegistroRespuestasAdapter({
    required this.remote,
    required this.local
  });

  @override
  Future<Either<Exception, bool>> guardarRespuestas(List<RegistroRespuestas> respuestas) async {

    final folio = local.getFolio();

    final response = await remote.guardarRespuestas(respuestas.map((respuesta) =>
        RegistroRespuestasModel(
            folio: folio,
            idPregunta: respuesta.idPregunta,
            descripcioPregunta: respuesta.descripcionPregunta,
            respuesta: respuesta.respuesta,
            puntaje: respuesta.puntaje
        )
    ).toList());

    return response.fold(
            (failure) => Left(failure),
            (response) => Right(response)
    );

  }

}