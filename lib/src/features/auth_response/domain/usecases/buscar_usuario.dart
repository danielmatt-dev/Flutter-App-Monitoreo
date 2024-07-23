import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';

// <>
class BuscarUsuario {

  final AuthRepository repository;

  BuscarUsuario(this.repository);

  @override
  Future<String> call(NoParams params) async => repository.getUsuario();

}