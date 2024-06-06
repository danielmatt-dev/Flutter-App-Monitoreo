import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_response.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class BuscarValoresDia extends UseCase<List<ValorGlucosaResponse>, BuscarValoresDiaParams>{

  final ValorGlucosaRepository repository;

  BuscarValoresDia(this.repository);

  @override
  Future<Either<Exception, List<ValorGlucosaResponse>>> call(BuscarValoresDiaParams params) =>
      repository.buscarValoresDelDia(params.folio, params.fecha);

}

class BuscarValoresDiaParams extends Equatable {

  final int folio;
  final String fecha;

  const BuscarValoresDiaParams({
    required this.folio,
    required this.fecha
  });

  @override
  List<Object?> get props => [folio, fecha];

}

// <>