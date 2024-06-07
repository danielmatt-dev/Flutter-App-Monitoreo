import 'package:app_plataforma/src/features/paciente/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CrearRegistroRespuesta extends UseCase<RegistroRespuestas, CrearRegistroRespuestaParams>{

  final AuthLocalDatasource local;

  CrearRegistroRespuesta(this.local);

  @override
  Future<Either<Exception, RegistroRespuestas>> call(CrearRegistroRespuestaParams params) async {

    try {

      final idPaciente = local.getIdPaciente();

      if(idPaciente == null) {
        return Left(ResourceNotFoundException(message: 'idPaciente no encontrado'));
      }

      return Right(
          RegistroRespuestas(
            idPaciente: idPaciente,
            idPregunta: params.idPregunta,
            descripcioPregunta: params.descripcioPregunta,
            respuesta: params.respuesta,
            puntaje: params.puntaje
          )
      );

    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}

class CrearRegistroRespuestaParams extends Equatable {

  final String idPregunta;
  final String descripcioPregunta;
  final String respuesta;
  final int puntaje;

  const CrearRegistroRespuestaParams({
    required this.idPregunta,
    required this.descripcioPregunta,
    required this.respuesta,
    required this.puntaje
  });

  @override
  List<Object?> get props => [idPregunta, descripcioPregunta, respuesta, puntaje];

}

// <>