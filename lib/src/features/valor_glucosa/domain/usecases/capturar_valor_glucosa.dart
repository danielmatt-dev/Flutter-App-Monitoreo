import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CapturarValorGlucosa extends UseCase<ValorGlucosaRequest, CapturarValorGlucosaParams> {

  @override
  Future<Either<Exception, ValorGlucosaRequest>> call(CapturarValorGlucosaParams params) async {
    try {

      final request = ValorGlucosaRequest(
          idPaciente: params.idPaciente,
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

  final String idPaciente;
  final int valor;
  final String medicion;
  final String notas;

  const CapturarValorGlucosaParams({
    required this.idPaciente,
    required this.valor,
    required this.medicion,
    required this.notas
  });

  @override
  List<Object?> get props => [idPaciente, valor, medicion, notas];

}