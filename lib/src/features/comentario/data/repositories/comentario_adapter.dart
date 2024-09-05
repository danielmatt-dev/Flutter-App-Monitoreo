import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/comentario/data/data_sources/remote/comentario_remote_datasource.dart';
import 'package:app_plataforma/src/features/comentario/data/models/comentario_model.dart';
import 'package:app_plataforma/src/features/comentario/domain/repositories/comentario_repository.dart';
import 'package:dartz/dartz.dart';

class ComentarioAdapter extends ComentarioRepository {
  
  final ComentarioRemoteDatasource _remote;
  final AuthRepository _local;
  
  ComentarioAdapter(
      ComentarioRemoteDatasource remote,
      AuthRepository local
      ): _remote = remote, _local = local;
  
  @override
  Future<Either<Exception, bool>> guardarComentario(String comentario) async {

    final folioResult = _local.getFolio();
    if(folioResult.isLeft()){
      return Left(folioResult.swap().getOrElse(() => Exception('Error al obtener el folio')));
    }

    final folio = folioResult.getOrElse(() => 0);

    return _remote.guardarComentario(
        ComentarioModel(
          folio: folio,
          descripcion: comentario,
        ),
        _local.getToken()
    );
}
}