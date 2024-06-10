import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/paciente_remote_datasource.dart';
import 'package:app_plataforma/src/features/auth_response/data/models/mapper/auth_response_mapper.dart';
import 'package:app_plataforma/src/features/paciente/data/models/mapper/paciente_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_password.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_update_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:dartz/dartz.dart';

class PacienteAdapter extends PacienteRepository {

  final PacienteRemoteDatasource remote;
  final AuthRepository local;
  final PacienteMapper mapper;
  final AuthResponseMapper authMapper;

  PacienteAdapter({
    required this.remote,
    required this.local,
    required this.mapper,
    required this.authMapper
  });

  @override
  Future<Either<Exception, PacienteResponse>> buscarPaciente() async {

    return local.getIdPaciente().fold(
            (failure) => Left(failure),
            (idPaciente) async {
              final response = await remote.buscarPacientePorId(idPaciente);

              return response.fold(
                      (failure) async => Left(failure),
                      (model) async => Right(mapper.toPaciente(model))
              );
            }
    );

  }

  @override
  Future<Either<Exception, bool>> crearCuenta(PacienteRequest request) async {

    final response = await remote.crearCuenta(mapper.toPacienteRequestModel(request));

    return response.fold(
            (failure) async => Left(failure),
            (auth) async => const Right(true)
    );

  }

  @override
  Future<Either<Exception, bool>> iniciarSesion(Usuario usuario) async {

    final response = await remote.iniciarSesion(mapper.toUsuarioModel(usuario));

    return response.fold(
            (failure) async => Left(failure),
            (authModel) async {

              final save = await local.saveAuthResponse(authMapper.toAuthReponse(authModel));

              return save.fold(
                      (failure) async => Left(failure),
                      (success) => Right(success)
              );
            }
    );

  }

  @override
  Future<Either<Exception, bool>> actualizarPaciente(PacienteUpdateRequest request) async {

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {
              final paciente = mapper.toPacienteUpdateRequestModel(request);

              paciente.folio = folio;

              final response = await remote.actualizarPaciente(paciente);

              return response.fold(
                      (failure) => Left(failure),
                      (success) => Right(success)
              );

            }
    );

  }

  @override
  Future<Either<Exception, bool>> actualizarPassword(PacientePassword pacientePassword) async {

    return local.getIdPaciente().fold(
            (failure) => Left(failure),
            (idPaciente) async {

              pacientePassword.idPaciente = idPaciente;
              final request = mapper.toPacientePasswordModel(pacientePassword);

              final response = await remote.actualizarPassword(request);

              return response.fold(
                      (failure) => Left(failure),
                      (success) => Right(success)
              );

            }
    );

  }

}