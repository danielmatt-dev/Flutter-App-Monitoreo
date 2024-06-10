import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class CrearCuenta extends UseCase<bool, PacienteRequest>{

  final PacienteRepository repository;

  CrearCuenta(this.repository);

  @override
  Future<Either<Exception, bool>> call(PacienteRequest params) async =>
      await repository.crearCuenta(params);

}