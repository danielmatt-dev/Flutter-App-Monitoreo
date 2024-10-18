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

  final PacienteRemoteDatasource _remote;
  final AuthRepository _local;
  final PacienteMapper _mapper;
  final AuthResponseMapper _authMapper;

  PacienteAdapter({
    required PacienteRemoteDatasource remote,
    required AuthRepository local,
    required PacienteMapper mapper,
    required AuthResponseMapper authMapper
  }) : _authMapper = authMapper, _mapper = mapper, _local = local, _remote = remote;

  @override
  Future<Either<Exception, PacienteResponse>> buscarPaciente() async {

    final idPaciente= _local.getIdPaciente();

    if(idPaciente == ''){
      throw Exception("Id no encontrado");
    }

    final response = await _remote.buscarPacientePorId(idPaciente, _local.getToken());
    return response.fold(
            (failure) => Left(failure),
            (model) => Right(_mapper.toPaciente(model))
    );
  }

  @override
  Future<Either<Exception, bool>> crearCuenta(PacienteRequest request) async {

    final response = await _remote.crearCuenta(_mapper.toPacienteRequestModel(request), _local.getFcmToken());

    return response.fold(
            (failure) => Left(failure),
            (auth) async {

              final save = await _local.saveAuthResponse(_authMapper.toAuthReponse(auth));

              return save.fold(
                      (failure) => Left(failure),
                      (success) => Right(success)
              );
            }
    );

  }

  @override
  Future<Either<Exception, bool>> iniciarSesion(Usuario usuario) async {

    final model = _mapper.toUsuarioModel(usuario);

    final response = await _remote.iniciarSesion(model, _local.getFcmToken());

    return response.fold(
            (failure) => Left(failure),
            (authModel) async {

              final save = await _local.saveAuthResponse(_authMapper.toAuthReponse(authModel));

              return save.fold(
                      (failure) => Left(failure),
                      (success) => Right(success)
              );
            }
    );

  }

  @override
  Future<Either<Exception, bool>> actualizarPaciente(PacienteUpdateRequest request) async {

    final folioResult = _local.getFolio();
    if(folioResult.isLeft()){
      return Left(folioResult.swap().getOrElse(() => Exception('Error al obtener el folio')));
    }
    final folio = folioResult.getOrElse(() => 0);

    final paciente = _mapper.toPacienteUpdateRequestModel(request);
    paciente.folio = folio;

    final response = await _remote.actualizarPaciente(paciente, _local.getToken());

    return response.fold(
            (failure) => Left(failure),
            (authModel) async {

              final save = await _local.saveAuthResponse(_authMapper.toAuthReponse(authModel));

              return save.fold(
                      (failure) => Left(failure),
                      (success) => Right(success)
              );
            }
            );
  }

  @override
  Future<Either<Exception, bool>> actualizarPassword(PacientePassword pacientePassword) async {

    final idPaciente = _local.getIdPaciente();

    final model = _mapper.toPacientePasswordModel(pacientePassword);
    model.idPaciente = idPaciente;

    final response = await _remote.actualizarPassword(model, _local.getToken());

    return response.fold(
            (failure) => Left(failure),
            (authModel) async {

              final save = await _local.saveAuthResponse(_authMapper.toAuthReponse(authModel));

              return save.fold(
                  (failure) => Left(failure),
                  (success) => Right(success)
          );
        }
    );
  }

  @override
  Future<Either<Exception, bool>> reestablecerPassword(Usuario usuario) async {

    final model = _mapper.toUsuarioModel(usuario);

    final response = await _remote.reestablecerPassword(model, _local.getToken());

    return response.fold(
            (failure) => Left(failure),
            (authModel) async {

              final save = await _local.saveAuthResponse(_authMapper.toAuthReponse(authModel));

              return save.fold(
                      (failure) => Left(failure),
                      (success) => Right(success)
              );
        }
    );

  }

  @override
  Future<Either<Exception, bool>> validarCorreo(String correo) async {

    final response = await _remote.validarCorreo(correo);

    return response.fold(
            (failure) => Left(failure),
            (authModel) async {

              final save = await _local.saveAuthResponse(_authMapper.toAuthReponse(authModel));

              return save.fold(
                      (failure) => Left(failure),
                      (success) => Right(success)
              );
            }
            );
  }

  @override
  Future<Either<Exception, bool>> buscarPerfilAsignado() async {

    final folioResult = _local.getFolio();
    if(folioResult.isLeft()){
      return Left(folioResult.swap().getOrElse(() => Exception('Error al obtener el folio')));
    }
    final folio = folioResult.getOrElse(() => 0);

    final response = await _remote.buscarPerfilAsignado(folio, _local.getToken());

    return response.fold(
            (failure) => Left(failure),
            (success) {
              _local.setTienePerfilAsignado(success);
              return Right(success);
            }
    );

  }

  @override
  Future<Either<Exception, bool>> validarExistenciaCorreo(String correo) async =>
       await _remote.validarExistenciaCorreo(correo);

  @override
  Future<Either<Exception, bool>> validarActualizacionCorreo(String correo) async =>
      await _remote.validarActualizacionCorreo(correo, _local.getToken());

}