import 'package:app_plataforma/src/features/auth_response/domain/entities/auth_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class CrearCuenta extends UseCase<AuthResponse, PacienteRequest>{

  final PacienteRepository repository;

  CrearCuenta(this.repository);

  @override
  Future<Either<Exception, AuthResponse>> call(PacienteRequest params) => repository.crearCuenta(params);

}