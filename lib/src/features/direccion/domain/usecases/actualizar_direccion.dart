import 'package:app_plataforma/src/features/direccion/domain/entities/direccion.dart';
import 'package:app_plataforma/src/features/direccion/domain/repositories/direccion_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class ActualizarDireccion extends UseCase<bool, Direccion> {

  final DireccionRepository repository;

  ActualizarDireccion(this.repository);

  @override
  Future<Either<Exception, bool>> call(Direccion params) async =>
      await repository.actualizarDireccion(params);

}