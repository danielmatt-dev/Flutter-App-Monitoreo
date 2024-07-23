import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';

// <>
class GetIsDarkMode {

  final AuthRepository repository;

  GetIsDarkMode(this.repository);

  Future<bool> call(NoParams params) async => repository.isDarkMode();

}