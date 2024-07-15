part of 'medicion_cubit.dart';

@freezed
sealed class MedicionState with _$MedicionState {

  const factory MedicionState.initial() = _Initial;
  const factory MedicionState.listSuccess(List<String> mediciones) = _Success;
  const factory MedicionState.emptyList() = _Empty;
  const factory MedicionState.error(String message) = _Error;

}