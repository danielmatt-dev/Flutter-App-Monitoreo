import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/data_sources/remote/registro_respuestas_remote_datasource.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/models/registro_respuestas_model.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/repositories/registro_respuestas_repository.dart';
import 'package:dartz/dartz.dart';

class RegistroRespuestasAdapter extends RegistroRespuestasRepository {

  final List<RegistroRespuestas> _respuestas = [];
  final RegistroRespuestasRemoteDatasource remote;
  final AuthRepository repository;

  RegistroRespuestasAdapter({
    required this.remote,
    required this.repository
  });

  @override
  Future<Either<Exception, bool>> guardarRespuestas(List<RegistroRespuestas> respuestas) async {

    return repository.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

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
            );

  }

  @override
  List<RegistroRespuestas> getRespuestas() => _respuestas;

  @override
  void ingresarRegistro(RegistroRespuestas registro) => _respuestas.add(registro);

}