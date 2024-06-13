import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_response.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarValoresGlucosaDia extends UseCase<List<ValorResponse>, String>{

  final ValorGlucosaRepository repository;

  BuscarValoresGlucosaDia(this.repository);

  @override
  Future<Either<Exception, List<ValorResponse>>> call(String params) async =>
      await repository.buscarValoresGlucosaDelDia(params);

}

// <>