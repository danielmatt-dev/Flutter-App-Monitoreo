import 'package:app_plataforma/src/features/paciente/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_request.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CapturarValorGlucosa extends UseCase<ValorGlucosaRequest, CapturarValorGlucosaParams> {

  @override
  Future<Either<Exception, ValorGlucosaRequest>> call(CapturarValorGlucosaParams params) async {
    try {

      final request = ValorGlucosaRequest(
          valor: params.valor,
          medicion: params.medicion,
          notas: params.notas
      );

      return Right(request);

    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}

class CapturarValorGlucosaParams extends Equatable {

  final int valor;
  final String medicion;
  final String notas;

  const CapturarValorGlucosaParams({
    required this.valor,
    required this.medicion,
    required this.notas
  });

  @override
  List<Object?> get props => [valor, medicion, notas];

}