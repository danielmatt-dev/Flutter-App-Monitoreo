part of 'paciente_bloc.dart';

@immutable
sealed class PacienteState extends Equatable {

  const PacienteState();

  @override
  List<Object?> get props => [];

}

class CombinedFormState extends PacienteState {

  final ContactoFormState contactoFormState;
  final UsuarioFormState usuarioFormState;
  final FormzStatus status;

  const CombinedFormState({
    this.contactoFormState = const ContactoFormState(),
    this.usuarioFormState = const UsuarioFormState(),
    this.status = FormzStatus.pure
  });

  bool get isFormValid => contactoFormState.isValid && usuarioFormState.isValid;

  CombinedFormState copyWith({
    ContactoFormState? contactoFormState,
    UsuarioFormState? usuarioFormState,
    FormzStatus? status
  }) {
    return CombinedFormState(
      contactoFormState: contactoFormState ?? this.contactoFormState,
      usuarioFormState: usuarioFormState ?? this.usuarioFormState,
      status: status ?? this.status
    );
  }

  @override
  List<Object?> get props => [
    contactoFormState,
    usuarioFormState,
    status
  ];

}

class ContactoFormState extends PacienteState {

  final Texto nombre;
  final Texto apellidoPaterno;
  final Texto apellidoMaterno;
  final Telefono telefono;
  final Email correo;
  final FormzStatus status;
  final String? error;

  bool get isValid => nombre.valid &&
          apellidoPaterno.valid &&
          apellidoMaterno.valid &&
          telefono.valid &&
          (correo.pure || correo.valid);

  const ContactoFormState({
    this.nombre = const Texto.pure(),
    this.apellidoPaterno = const Texto.pure(),
    this.apellidoMaterno = const Texto.pure(),
    this.telefono = const Telefono.pure(),
    this.correo = const Email.pure(),
    this.status = FormzStatus.pure,
    this.error,
  });

  ContactoFormState copyWith({
    Texto? nombre,
    Texto? apellidoPaterno,
    Texto? apellidoMaterno,
    Telefono? telefono,
    Email? correo,
    FormzStatus? status,
    String? error,
  }) {
    return ContactoFormState(
      nombre: nombre ?? this.nombre,
      apellidoPaterno: apellidoPaterno ?? this.apellidoPaterno,
      apellidoMaterno: apellidoMaterno ?? this.apellidoMaterno,
      telefono: telefono ?? this.telefono,
      correo: correo ?? this.correo,
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  List<Object?> get props => [nombre, apellidoPaterno, apellidoMaterno, telefono, correo, status, error];

}

class UsuarioFormState extends PacienteState {

  final Email correo;
  final Password newPassword;
  final ConfirmPassword confirmPassword;
  final FormzStatus status;
  final String? error;

  const UsuarioFormState({
    this.correo = const Email.pure(),
    this.newPassword = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.status = FormzStatus.pure,
    this.error
  });

  bool get isValid => correo.valid && newPassword.valid && confirmPassword.valid;

  UsuarioFormState copyWith({
    Email? correo,
    Password? newPassword,
    ConfirmPassword? confirmPassword,
    FormzStatus? status,
    String? error,
  }) {
    return UsuarioFormState(
      correo: correo ?? this.correo,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      error: error
    );
  }

  @override
  List<Object?> get props => [correo, newPassword, confirmPassword, status, error];

}

// Estado inicial
class PacienteInicial extends PacienteState {}

// Cargando Paciente
class PacienteLoading extends PacienteState {}

// Paciente por id cargado
class PacienteSuccess extends PacienteState {

  final Map<String, String> mapContacto;
  final Map<String, String> mapFichaTecnica;
  final Map<String, String> mapSomatometria;
  final Map<String, String> mapFichaMedica;
  final Map<String, String> mapDoctor;
  final Map<String, String> mapData;

  const PacienteSuccess(
      this.mapContacto,
      this.mapFichaTecnica,
      this.mapSomatometria,
      this.mapFichaMedica,
      this.mapDoctor,
      this.mapData
      );

  @override
  List<Object?> get props => [
    mapContacto,
    mapFichaTecnica,
    mapSomatometria,
    mapFichaMedica,
    mapDoctor,
    mapData
  ];

}

class UserAndEmailSuccess extends PacienteState {

  final String usuario;
  final String correo;

  const UserAndEmailSuccess(this.usuario, this.correo);

  @override
  List<Object?> get props => [usuario, correo];

}

//
class SignUpSuccess extends PacienteState {}

// Paciente Actualizado
class PacienteUpdateSuccess extends PacienteState {}

class PacienteNonValidateUpdate extends PacienteState {}

// Error al cargar al paciente
class PacienteError extends PacienteState {

  final String error;

  const PacienteError(this.error);

  @override
  List<Object?> get props => [error];

}
