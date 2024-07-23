import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/direccion/data/data_sources/remote/direccion_remote_datasource.dart.dart';
import 'package:app_plataforma/src/features/direccion/data/models/mapper/direccion_mapper.dart';
import 'package:app_plataforma/src/features/direccion/domain/entities/direccion.dart';
import 'package:app_plataforma/src/features/direccion/domain/entities/direccion_response.dart';
import 'package:app_plataforma/src/features/direccion/domain/repositories/direccion_repository.dart';
import 'package:dartz/dartz.dart';

class DireccionAdapter extends DireccionRepository {
  
  final DireccionRemoteDatasource remote;
  final DireccionMapper mapper;
  final AuthRepository local;

  DireccionAdapter({
    required this.remote,
    required this.local,
    required this.mapper,
  });
  
  @override
  Future<Either<Exception, bool>> actualizarDireccion(Direccion direccion) async {

    direccion.id = local.getIdPaciente();

    final response = await remote.actualizarDireccion(mapper.toDireccionModel(direccion));

    return response.fold(
            (failure) => Left(failure),
            (success) => Right(success)
    );

  }

  @override
  Future<Either<Exception, DireccionResponse>> buscarDireccion(String codigoPostal) async {
    final response = await remote.buscarDireccion(codigoPostal);
    
    return response.fold(
            (failure) => Left(failure), 
            (direccion) => Right(mapper.toDireccionResponse(direccion))
    );
    
  }
}