part of 'promedio_bloc.dart';

@freezed
class PromedioState with _$PromedioState {

  const factory PromedioState.initial() = _Initial;
  const factory PromedioState.loading() = _Loading;
  const factory PromedioState.success(List<Promedio> promedios) = _Success;
  const factory PromedioState.error(String message) = _Error;

}
