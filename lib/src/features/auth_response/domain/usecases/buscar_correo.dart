import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';

class BuscarCorreo {

  final AuthRepository repository;

  BuscarCorreo(this.repository);

  Future<String> call(NoParams params) async => repository.getCorreo();

}