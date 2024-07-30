part of 'paciente_bloc.dart';

@immutable
sealed class PacienteEvent extends Equatable {

  const PacienteEvent();

  @override
  List<Object?> get props => [];

}

//  Evento para buscar al paciente
class BuscarDatosPacienteEvent extends PacienteEvent {

  const BuscarDatosPacienteEvent();

}

// Evento para buscar el usuario y correo
class GetUserAndEmailEvent extends PacienteEvent {}

//  Evento para actualizar los datos del paciente
class ActualizarPacienteEvent extends PacienteEvent {

  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final DateTime fechaNacimiento;
  final String genero;
  final String estadoCivil;
  final String nivelEstudios;
  final int numMiembrosHogar;
  final String tipoDiabetes;
  final String tiempoDiabetes;
  final double peso;
  final double talla;
  final String factorActividad;
  final String telefono;
  final String correo;


  const ActualizarPacienteEvent({
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.fechaNacimiento,
    required this.genero,
    required this.estadoCivil,
    required this.nivelEstudios,
    required this.numMiembrosHogar,
    required this.tipoDiabetes,
    required this.tiempoDiabetes,
    required this.peso,
    required this.talla,
    required this.factorActividad,
    required this.telefono,
    required this.correo
  });

  @override
  List<Object?> get props => [nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento,
  genero, estadoCivil, nivelEstudios, numMiembrosHogar, tipoDiabetes, tiempoDiabetes, peso,
  talla, factorActividad, telefono, correo];

}

// Eventos para validar los forms
class InitializeFormEvent extends PacienteEvent {
  final FormType formType;

  const InitializeFormEvent(this.formType);

  @override
  List<Object?> get props => [formType];
}

class ValidateFormEvent extends PacienteEvent {

  final FormType formType;

  const ValidateFormEvent(this.formType);

  @override
  List<Object?> get props => [formType];

}

enum FormType { user, contact, both }

class ValidateContactFormEvent extends PacienteEvent {}

class ValidateUserFormEvent extends PacienteEvent {}

class ValidateBothFormsEvent extends PacienteEvent {}

// Form Contacto
class ContactoNombreChanged extends PacienteEvent {
  final String nombre;

  const ContactoNombreChanged(this.nombre);

  @override
  List<Object?> get props => [nombre];
}

class ContactoApellidoPaternoChanged extends PacienteEvent {
  final String apellidoPaterno;

  const ContactoApellidoPaternoChanged(this.apellidoPaterno);

  @override
  List<Object?> get props => [apellidoPaterno];
}

class ContactoApellidoMaternoChanged extends PacienteEvent {
  final String apellidoMaterno;

  const ContactoApellidoMaternoChanged(this.apellidoMaterno);

  @override
  List<Object?> get props => [apellidoMaterno];
}

class ContactoTelefonoChanged extends PacienteEvent {
  final String telefono;

  const ContactoTelefonoChanged(this.telefono);

  @override
  List<Object?> get props => [telefono];
}

class ContactoCorreoChanged extends PacienteEvent {
  final String correo;

  const ContactoCorreoChanged(this.correo);

  @override
  List<Object?> get props => [correo];
}

// Form Usuario

class UsuarioCorreoChanged extends PacienteEvent {
  final String correo;

  const UsuarioCorreoChanged(this.correo);

  @override
  List<Object?> get props => [correo];
}

class UsuarioPasswordChanged extends PacienteEvent {
  final String newPassword;

  const UsuarioPasswordChanged(this.newPassword);

  @override
  List<Object?> get props => [newPassword];
}

class UsuarioConfirmPasswordChanged extends PacienteEvent {
  final String confirmPassword;

  const UsuarioConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object?> get props => [confirmPassword];
}