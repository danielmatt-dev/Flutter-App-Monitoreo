import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/repositories/registro_respuestas_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class GuardarRespuestasSomatometria extends UseCase<bool, Map<int, RegistroRespuestas>> {

  final RegistroRespuestasRepository _repository;

  GuardarRespuestasSomatometria(this._repository);

  @override
  Future<Either<Exception, bool>> call(Map<int, RegistroRespuestas> params) async {

    if(params.length != 2){
      return Left(Exception('Test de somatometría no válido'));
    }

    return _repository.guardarRespuestaSomatometria(List.from(params.values));
  }

}

// <>