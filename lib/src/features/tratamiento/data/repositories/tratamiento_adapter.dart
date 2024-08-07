import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/tratamiento/data/data_sources/remote/tratamiento_remote_datasource.dart';
import 'package:app_plataforma/src/features/tratamiento/data/models/mapper/tratamiento_mapper.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/repositories/tratamiento_repository.dart';
import 'package:dartz/dartz.dart';

class TratamientoAdapter extends TratamientoRepository {

  final TratamientoRemoteDatasource _remoteDatasource;
  final TratamientoMapper _mapper;
  final AuthRepository _local;

  TratamientoAdapter(
      TratamientoRemoteDatasource remoteDatasource,
      TratamientoMapper mapper,
      AuthRepository local
  ): _remoteDatasource = remoteDatasource, _mapper = mapper, _local = local;

  @override
  Future<Either<Exception, List<Tratamiento>>> buscarTratamientos() async {

    final result = await _remoteDatasource.buscarTratamientos(_local.getToken());

    return result.fold(
            (failure) => Left(Exception(failure.toString())),
            (models) => Right(models.map((model) => _mapper.toTratamiento(model)).toList())
    );

  }

}