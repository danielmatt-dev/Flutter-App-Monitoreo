import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/repositories/registro_respuestas_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class GuardarRespuestas extends UseCase<bool, List<RegistroRespuestas>> {

  final RegistroRespuestasRepository repository;

  GuardarRespuestas(this.repository);

  @override
  Future<Either<Exception, bool>> call(List<RegistroRespuestas> params) =>
      repository.guardarRespuestas(params);

}

// <>