import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_response.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_search_request.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/repositories/imagen_paciente_repository.dart';

import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class BuscarImagenes extends UseCase<List<ImagenPacienteResponse>, ImagenPacienteSearchRequest> {

  final ImagenPacienteRepository repository;

  BuscarImagenes({required this.repository});

  @override
  Future<Either<Exception, List<ImagenPacienteResponse>>> call(ImagenPacienteSearchRequest params) async =>
      repository.buscarImagenes(params);

}