import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:dartz/dartz.dart';

abstract class RegistroRespuestasRepository {

  Future<Either<Exception, bool>> guardarRespuestas(List<RegistroRespuestas> respuestas);

  Future<Either<Exception, bool>> guardarRespuestaSomatometria(List<RegistroRespuestas> respuestas);

}

// <>