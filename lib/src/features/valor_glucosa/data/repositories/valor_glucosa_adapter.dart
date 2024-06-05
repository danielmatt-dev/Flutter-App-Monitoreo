import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/valor_glucosa_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/mapper/valor_glucosa_mapper.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_response.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:dartz/dartz.dart';

class ValorGlucosaAdapter extends ValorGlucosaRepository {

  final ValorGlucosaRemoteDataSource remote;
  final ValorGlucosaMapper mapper;

  ValorGlucosaAdapter({required this.remote, required this.mapper});

  @override
  Future<Either<Exception, List<ValorGlucosaResponse>>> buscarValoresDelDia(int folio, String fecha) async {

    final response = await remote.buscarValoresDelDia(folio, fecha);

    return response.fold(
            (failure) => Left(failure),
            (valores) => Right(valores.map((model) => mapper.toValorGlucosaResponse(model)).toList())
    );
  }

  @override
  Future<Either<Exception, bool>> ingresarValorGlucosa(ValorGlucosaRequest request) async {

    final response = await remote.ingresarValor(mapper.toValorGlucosaRequestModel(request));

    return response.fold(
            (failure) => Left(failure),
            (sucess) => Right(sucess)
    );

  }

}