import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_request.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_response.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_search_request.dart';
import 'package:dartz/dartz.dart';

abstract class ImagenPacienteRepository {

  Future<Either<Exception, bool>> guardarImagen(ImagenPacienteRequest request);

  Future<Either<Exception, List<ImagenPacienteResponse>>> buscarImagenes(ImagenPacienteSearchRequest request);

}