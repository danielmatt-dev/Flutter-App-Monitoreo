import 'package:app_plataforma/src/features/registro_respuestas/data/data_sources/remote/registro_respuestas_remote_datasource.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/models/mapper/registro_respuestas_mapper.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/repositories/registro_respuestas_repository.dart';
import 'package:dartz/dartz.dart';

class RegistroRespuestasAdapter extends RegistroRespuestasRepository {

  final RegistroRespuestasRemoteDatasource remote;
  final RegistroRespuestasMapper mapper;

  RegistroRespuestasAdapter({
    required this.remote,
    required this.mapper
  });

  @override
  Future<Either<Exception, bool>> guardarRespuestas(List<RegistroRespuestas> respuestas) async {

    final response = await remote.guardarRespuestas(respuestas.map((respuesta) => mapper.toRegistroRespuestasModel(respuesta)).toList());

    return response.fold(
            (failure) => Left(failure),
            (response) => Right(response)
    );

  }

}