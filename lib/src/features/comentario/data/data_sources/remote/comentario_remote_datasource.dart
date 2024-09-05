import 'package:app_plataforma/src/features/comentario/data/models/comentario_model.dart';
import 'package:dartz/dartz.dart';

abstract class ComentarioRemoteDatasource {

  // <>
  Future<Either<Exception, bool>> guardarComentario(ComentarioModel model, String token);

}