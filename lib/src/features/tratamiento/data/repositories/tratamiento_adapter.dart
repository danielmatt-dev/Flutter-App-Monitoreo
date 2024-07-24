import 'package:app_plataforma/src/features/tratamiento/data/data_sources/remote/tratamiento_remote_datasource.dart';
import 'package:app_plataforma/src/features/tratamiento/data/models/mapper/tratamiento_mapper.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/repositories/tratamiento_repository.dart';
import 'package:dartz/dartz.dart';

class TratamientoAdapter extends TratamientoRepository {

  final TratamientoRemoteDatasource _remoteDatasource;
  final TratamientoMapper _mapper;

  TratamientoAdapter(
      TratamientoRemoteDatasource remoteDatasource,
      TratamientoMapper mapper
  ): _remoteDatasource = remoteDatasource, _mapper = mapper;

  @override
  Future<Either<Exception, List<Tratamiento>>> buscarTratamientos() async {

    final result = await _remoteDatasource.buscarTratamientos();

    return result.fold(
            (failure) => Left(Exception(failure.toString())),
            (models) => Right(models.map((model) => _mapper.toTratamiento(model)).toList())
    );

  }

}