import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_request.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// <>
class CapturarValorPresion extends UseCase<ValorPresionRequest, CapturarValorPresionParams> {

  @override
  Future<Either<Exception, ValorPresionRequest>> call(CapturarValorPresionParams params) async {

    try {

      return Right(
        ValorPresionRequest(
          valorSistolica: params.valorSistolica,
          valorDiastolica: params.valorDiastolica,
          medicion: params.medicion,
          notas: params.notas
        )
      );

    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}


class CapturarValorPresionParams extends Equatable {

  final int valorSistolica;
  final int valorDiastolica;
  final String medicion;
  final String notas;

  const CapturarValorPresionParams({
    required this.valorSistolica,
    required this.valorDiastolica,
    required this.medicion,
    required this.notas
  });

  @override
  List<Object?> get props => [valorSistolica, valorDiastolica, medicion, notas];

}