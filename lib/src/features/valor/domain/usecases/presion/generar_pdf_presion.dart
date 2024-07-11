import 'package:app_plataforma/src/features/valor/domain/repositories/valor_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class GenerarPdfPresion extends UseCase<void, int>{

  final ValorRepository repository;

  GenerarPdfPresion(this.repository);

  @override
  Future<Either<Exception, void>> call(int params) async => repository.generarPdf(params);

}