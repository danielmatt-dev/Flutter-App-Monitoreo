import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarPerfilAsignado extends UseCase<bool, NoParams> {

  final PacienteRepository _repository;

  BuscarPerfilAsignado(PacienteRepository repository): _repository = repository;

  @override
  Future<Either<Exception, bool>> call(NoParams params) =>
      _repository.buscarPerfilAsignado();

}