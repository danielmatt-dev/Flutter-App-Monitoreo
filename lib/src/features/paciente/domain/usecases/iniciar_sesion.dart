import 'package:app_plataforma/src/features/paciente/domain/entities/auth_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class IniciarSesion extends UseCase<AuthResponse, Usuario>{

  final PacienteRepository repository;

  IniciarSesion(this.repository);

  @override
  Future<Either<Exception, AuthResponse>> call(Usuario params) => repository.iniciarSesion(params);

}

// <>