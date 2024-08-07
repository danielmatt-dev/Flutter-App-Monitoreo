import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/data_sources/remote/registro_respuestas_remote_datasource.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/models/mapper/registro_respuestas_mapper.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/models/registro_respuestas_model.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/repositories/registro_respuestas_repository.dart';
import 'package:dartz/dartz.dart';

class RegistroRespuestasAdapter extends RegistroRespuestasRepository {

  final RegistroRespuestasRemoteDatasource _remote;
  final RegistroRespuestasMapper _mapper;
  final AuthRepository _local;

  RegistroRespuestasAdapter(this._remote, this._mapper, this._local);

  @override
  Future<Either<Exception, bool>> guardarRespuestas(List<RegistroRespuestas> respuestas) async {

    final fcmToken = _local.getFcmToken();

    if(fcmToken == ''){
      throw Exception("FcmToken no encontrado");
    }

    /*  Folio  */
    final folioResult = _local.getFolio();
    if(folioResult.isLeft()){
      return Left(folioResult.swap().getOrElse(() => Exception('Error al obtener el folio')));
    }
    final folio = folioResult.getOrElse(() => 0);

    // Mapeando las respuestas a respuestasModel
    final respuestasModel = respuestas.map((respuesta) {
      final model = _mapper.toRegistroRespuestasModel(respuesta);
      model.folio = folio;
      return model;
    }).toList();

    final response = await _remote.guardarRespuestas(
        RegistroRequestModel(
            fcmToken: fcmToken,
            respuestas: respuestasModel),
        _local.getToken()
    );

    return response.fold(
            (failure) => Left(failure),
            (response) => Right(response)
    );
  }

  @override
  Future<Either<Exception, bool>> guardarRespuestaSomatometria(List<RegistroRespuestas> respuestas) async {

    /*  Folio  */
    final folioResult = _local.getFolio();
    if(folioResult.isLeft()){
      return Left(folioResult.swap().getOrElse(() => Exception('Error al obtener el folio')));
    }
    final folio = folioResult.getOrElse(() => 0);

    for(RegistroRespuestas respuesta in respuestas){

      final model = _mapper.toRegistroRespuestasModel(respuesta);
      model.folio = folio;

      final result = await _remote.guardarRespuestaSomatometria(model, _local.getToken());

      if(result.isLeft()){
        return Left(result.swap().getOrElse(() => Exception('Error al guardar respuesta')));
      }

    }
    return const Right(true);
  }

}