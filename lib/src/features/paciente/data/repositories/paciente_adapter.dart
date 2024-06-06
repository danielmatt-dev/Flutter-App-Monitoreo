import 'package:app_plataforma/src/features/paciente/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/paciente_remote_datasource.dart';
import 'package:app_plataforma/src/features/paciente/data/models/mapper/paciente_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/auth_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:dartz/dartz.dart';

class PacienteAdapter extends PacienteRepository {

  final PacienteRemoteDatasource remote;
  final AuthLocalDatasource local;
  final PacienteMapper mapper;

  PacienteAdapter({
    required this.remote,
    required this.local,
    required this.mapper
  });

  @override
  Future<Either<Exception, PacienteResponse>> buscarPaciente(String idPaciente) async {

    final response = await remote.buscarPacientePorId(idPaciente);

    return response.fold(
            (failure) async => Left(failure),
            (model) async => Right(mapper.toPaciente(model))
    );

  }

  @override
  Future<Either<Exception, AuthResponse>> crearCuenta(PacienteRequest request) async {

    final response = await remote.crearCuenta(mapper.toPacienteRequestModel(request));

    return response.fold(
            (failure) async => Left(failure),
            (auth) async => Right(mapper.toAuthResponse(auth))
    );

  }

  @override
  Future<Either<Exception, AuthResponse>> iniciarSesion(Usuario usuario) async {

    final response = await remote.iniciarSesion(mapper.toUsuarioModel(usuario));

    return response.fold(
            (failure) async => Left(failure),
            (auth) async {
              local.saveAuthResponseModel(auth);
              return Right(mapper.toAuthResponse(auth));
            }
    );

  }

}