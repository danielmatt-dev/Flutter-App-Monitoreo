import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:dartz/dartz.dart';

abstract class RegistroRespuestasRepository {

  void ingresarRegistro(RegistroRespuestas registro);

  Future<Either<Exception, bool>> guardarRespuestas();

}

// <>