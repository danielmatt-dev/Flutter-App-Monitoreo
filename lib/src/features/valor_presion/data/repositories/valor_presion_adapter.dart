import 'package:app_plataforma/src/features/valor_presion/data/data_sources/remote/valor_presion_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_presion/data/models/mapper/valor_presion_mapper.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_response.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/repositories/valor_presion_repository.dart';
import 'package:dartz/dartz.dart';

class ValorPresionAdapter extends ValorPresionRepository {

  final ValorPresionRemoteDataSource remote;
  final ValorPresionMapper mapper;

  ValorPresionAdapter({
    required this.remote,
    required this.mapper
  });

  @override
  Future<Either<Exception, List<ValorPresionResponse>>> buscarValoresPresionDelDia(int folio, String fecha) async {

    final response = await remote.buscarValoresDelDia(folio, fecha);

    return response.fold(
            (failure) => Left(failure),
            (models) => Right(models.map((model) => mapper.toValorPresionResponse(model)).toList())
    );

  }

  @override
  Future<Either<Exception, bool>> ingresarValorPresion(ValorPresionRequest request) async {

    final response = await remote.ingresarValorPresion(mapper.toValorPresionRequestModel(request));

    return response.fold(
            (failure) => Left(failure),
            (r) => Right(r)
    );

  }


}