import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CrearRegistroRespuesta extends UseCase<RegistroRespuestas, CrearRegistroRespuestaParams>{

  @override
  Future<Either<Exception, RegistroRespuestas>> call(CrearRegistroRespuestaParams params) async {

    try {

      return Right(
          RegistroRespuestas(
            idPregunta: params.idPregunta,
            descripcionPregunta: params.descripcionPregunta,
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
  final String descripcionPregunta;
  final String respuesta;
  final int puntaje;

  const CrearRegistroRespuestaParams({
    required this.idPregunta,
    required this.descripcionPregunta,
    required this.respuesta,
    required this.puntaje
  });

  @override
  List<Object?> get props => [idPregunta, descripcionPregunta, respuesta, puntaje];

}

// <>