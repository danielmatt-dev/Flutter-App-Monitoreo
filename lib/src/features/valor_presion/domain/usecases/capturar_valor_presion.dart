import 'package:app_plataforma/src/features/paciente/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_request.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// <>
class CapturarValorPresion extends UseCase<ValorPresionRequest, CapturarValorPresionParams> {

  final AuthLocalDatasource local;

  CapturarValorPresion(this.local);

  @override
  Future<Either<Exception, ValorPresionRequest>> call(CapturarValorPresionParams params) async {

    try {

      final idPaciente = local.getIdPaciente();

      if(idPaciente == null) {
        return Left(ResourceNotFoundException(message: 'idPaciente no encontrado'));
      }

      return Right(
        ValorPresionRequest(
          idPaciente: idPaciente,
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