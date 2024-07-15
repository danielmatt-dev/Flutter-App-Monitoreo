import 'package:app_plataforma/src/features/mediciones/domain/repositories/medicion_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarMedicionesDelDia extends UseCase<List<String>, String> {

  final MedicionRepository repository;

  BuscarMedicionesDelDia(this.repository);

  @override
  Future<Either<Exception, List<String>>> call(String params) async {

    final result = await repository.buscarMedicionesDelDia(params);

    return result.fold(
            (failure) => Left(failure),
            (mediciones) => Right(mediciones.map((medicion) => medicion.medicion).toList())
    );

  }


}