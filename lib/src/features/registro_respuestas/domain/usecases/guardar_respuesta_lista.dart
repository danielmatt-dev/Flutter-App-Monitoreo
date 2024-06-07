import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class GuardarRespuestaEnLista extends UseCase<bool, RegistroRespuestas>{

  final List<RegistroRespuestas> respuestas;

  GuardarRespuestaEnLista(this.respuestas);

  @override
  Future<Either<Exception, bool>> call(RegistroRespuestas params) async {

    try {
      respuestas.add(params);
      return const Right(true);
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}

// <>