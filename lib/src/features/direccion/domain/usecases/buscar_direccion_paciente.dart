import 'package:app_plataforma/src/features/direccion/domain/entities/direccion.dart';
import 'package:app_plataforma/src/features/direccion/domain/repositories/direccion_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarDireccionPaciente extends UseCase<Direccion, NoParams> {

  final DireccionRepository repository;

  BuscarDireccionPaciente(this.repository);

  @override
  Future<Either<Exception, Direccion>> call(NoParams params) async =>
      repository.buscarDireccionPaciente();

}