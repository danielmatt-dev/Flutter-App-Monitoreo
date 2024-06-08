import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_response.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class BuscarValoresGlucosaDia extends UseCase<List<ValorGlucosaResponse>, BuscarValoresGlucosaParams>{

  final ValorGlucosaRepository repository;

  BuscarValoresGlucosaDia(this.repository);

  @override
  Future<Either<Exception, List<ValorGlucosaResponse>>> call(BuscarValoresGlucosaParams params) async =>
      await repository.buscarValoresGlucosaDelDia(params.folio, params.fecha);

}

class BuscarValoresGlucosaParams extends Equatable {

  final int folio;
  final String fecha;

  const BuscarValoresGlucosaParams({
    required this.folio,
    required this.fecha
  });

  @override
  List<Object?> get props => [folio, fecha];

}

// <>