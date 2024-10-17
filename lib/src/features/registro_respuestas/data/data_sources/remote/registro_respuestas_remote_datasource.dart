import 'package:app_plataforma/src/features/registro_respuestas/data/models/registro_respuestas_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegistroRespuestasRemoteDatasource {

  Future<Either<Exception, bool>> guardarRespuestas(List<RegistroRespuestasModel> respuestas, String token);

}

// <>