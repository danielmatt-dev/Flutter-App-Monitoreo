import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class GenerarPdfGlucosa extends UseCase<void, int>{

  final ValorGlucosaRepository repository;

  GenerarPdfGlucosa(this.repository);

  @override
  Future<Either<Exception, void>> call(int params) async => repository.generarPdf(params);

}