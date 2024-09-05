import 'package:dartz/dartz.dart';

abstract class ComentarioRepository {

  Future<Either<Exception, bool>> guardarComentario(String comentario);

}