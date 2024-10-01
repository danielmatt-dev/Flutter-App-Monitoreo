import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/imagen_paciente/data/data_sources/remote/imagen_paciente_remote_datasource.dart';
import 'package:app_plataforma/src/features/imagen_paciente/data/models/mapper/imagen_paciente_mapper.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_request.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_response.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_search_request.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/repositories/imagen_paciente_repository.dart';
import 'package:dartz/dartz.dart';

class ImagenPacienteAdapter extends ImagenPacienteRepository {

  final ImagenPacienteRemoteDatasource remote;
  final ImagenPacienteMapper mapper;
  final AuthRepository local;

  ImagenPacienteAdapter({
    required this.remote,
    required this.mapper,
    required this.local
  });

  @override
  Future<Either<Exception, List<ImagenPacienteResponse>>> buscarImagenes(ImagenPacienteSearchRequest request) async {

    final folioResult = local.getFolio();
    if(folioResult.isLeft()){
      return Left(folioResult.swap().getOrElse(() => Exception('Error al obtener el folio')));
    }
    final folio = folioResult.getOrElse(() => 0);

    final model = mapper.toImagenPacienteSearchResponseModel(request);
    model.folio = folio;

    return remote.buscarImagenes(model, local.getToken());
  }

  @override
  Future<Either<Exception, bool>> guardarImagen(ImagenPacienteRequest request) async {

    final folioResult = local.getFolio();
    if(folioResult.isLeft()){
      return Left(folioResult.swap().getOrElse(() => Exception('Error al obtener el folio')));
    }
    final folio = folioResult.getOrElse(() => 0);

    final model = mapper.toImagenPacienteRequestModel(request);
    model.folio = folio;

    return remote.guardarImagen(model, local.getToken());
  }
}