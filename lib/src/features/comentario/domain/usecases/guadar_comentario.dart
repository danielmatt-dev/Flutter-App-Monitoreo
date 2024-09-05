import 'package:app_plataforma/src/features/comentario/domain/repositories/comentario_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class GuardarComentario extends UseCase<bool, String> {

  final ComentarioRepository _repository;

  GuardarComentario(ComentarioRepository repository):
      _repository = repository;

  @override
  Future<Either<Exception, bool>> call(String params) => _repository.guardarComentario(params);

}
