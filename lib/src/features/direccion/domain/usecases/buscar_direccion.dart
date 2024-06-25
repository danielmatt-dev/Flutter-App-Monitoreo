import 'package:app_plataforma/src/features/direccion/domain/entities/direccion_response.dart';
import 'package:app_plataforma/src/features/direccion/domain/repositories/direccion_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarDireccion extends UseCase<DireccionResponse, String> {

  final DireccionRepository repository;

  BuscarDireccion(this.repository);

  @override
  Future<Either<Exception, DireccionResponse>> call(String params) async =>
      await repository.buscarDireccion(params);

}