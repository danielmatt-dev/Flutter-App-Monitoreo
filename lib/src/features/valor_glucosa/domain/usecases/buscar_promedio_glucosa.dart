import 'package:app_plataforma/src/shared/valor/entities/valor_average.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarPromedioGlucosa extends UseCase<ValorAverage, NoParams>{

  final ValorGlucosaRepository repository;

  BuscarPromedioGlucosa(this.repository);

  @override
  Future<Either<Exception, ValorAverage>> call(NoParams params) async  {

    final response = await repository.promedioGlucosa();

    return response.fold(
            (failure) => Left(failure),
            (valorPromedio) => Right(valorPromedio)
    );
  }

}

// <>