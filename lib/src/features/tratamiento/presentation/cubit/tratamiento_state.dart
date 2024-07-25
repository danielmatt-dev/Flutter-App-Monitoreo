part of 'tratamiento_cubit.dart';

// <>

@immutable
sealed class TratamientoState{ const TratamientoState(); }

class TratamientoInitial extends TratamientoState {}

class TratamientoLoading extends TratamientoState {}

class  TratamientoSuccess extends TratamientoState {

  final List<String> insulina;
  final List<String> orales;

  const TratamientoSuccess(this.insulina, this.orales);

}

class TratamientoError extends TratamientoState {

  final String message;

  const TratamientoError(this.message);

}