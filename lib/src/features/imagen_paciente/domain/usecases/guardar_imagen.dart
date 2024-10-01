import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_request.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/repositories/imagen_paciente_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class GuardarImagen extends UseCase<bool, ImagenPacienteRequest> {

  final ImagenPacienteRepository repository;

  GuardarImagen({required this.repository});

  @override
  Future<Either<Exception, bool>> call(ImagenPacienteRequest params) async =>
      repository.guardarImagen(params);

}