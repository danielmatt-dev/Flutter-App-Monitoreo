import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_response.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/repositories/valor_presion_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// <>
class BuscarValoresPresion extends UseCase<List<ValorPresionResponse>, BuscarValoresPresionParams> {

  final ValorPresionRepository repository;

  BuscarValoresPresion(this.repository);

  @override
  Future<Either<Exception, List<ValorPresionResponse>>> call(BuscarValoresPresionParams params) =>
      repository.buscarValoresPresionDelDia(params.folio, params.fecha);

}

class BuscarValoresPresionParams extends Equatable {

  final int folio;
  final String fecha;

  const BuscarValoresPresionParams({
    required this.folio,
    required this.fecha
  });

  @override
  List<Object?> get props => [folio, fecha];

}