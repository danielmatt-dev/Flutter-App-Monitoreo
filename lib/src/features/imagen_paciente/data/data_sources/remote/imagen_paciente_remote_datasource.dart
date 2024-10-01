import 'package:app_plataforma/src/features/imagen_paciente/data/models/imagen_paciente_request_model.dart';
import 'package:app_plataforma/src/features/imagen_paciente/data/models/imagen_paciente_response_model.dart';
import 'package:app_plataforma/src/features/imagen_paciente/data/models/imagen_paciente_search_request_model.dart';

import 'package:dartz/dartz.dart';

// <>
abstract class ImagenPacienteRemoteDatasource {

  Future<Either<Exception, bool>> guardarImagen(ImagenPacienteRequestModel model, String token);

  Future<Either<Exception, List<ImagenPacienteResponseModel>>> buscarImagenes(ImagenPacienteSearchRequestModel model, String token);

}