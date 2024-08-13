import 'package:app_plataforma/src/features/auth_response/domain/usecases/buscar_correo.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/buscar_usuario.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/mapper/paciente_map_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_update_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/actualizar_paciente.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_paciente.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/cubit/validation/email_validation.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/validations/telefono_validation.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/validations/texto_validation.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/bloc/validation/confirm_password_validation.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/bloc/validation/password_validation.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'paciente_event.dart';
part 'paciente_state.dart';

// <>
class PacienteBloc extends Bloc<PacienteEvent, PacienteState> {

  final BuscarPaciente buscarPaciente;
  final ActualizarPaciente actualizarPaciente;
  final PacienteMapMapper mapper;
  final BuscarUsuario buscarUsuario;
  final BuscarCorreo buscarCorreo;

  PacienteBloc({
    required this.buscarPaciente,
    required this.actualizarPaciente,
    required this.mapper,
    required this.buscarUsuario,
    required this.buscarCorreo
  }) : super(PacienteInicial()) {
    on<ValidateFormEvent>(_validateForm);
    on<InitializeFormEvent>(_initializeForm);

    on<BuscarDatosPacienteEvent>(_obtenerDatosPaciente);
    on<ActualizarPacienteEvent>(_actualizarPaciente);
    on<GetUserAndEmailEvent>(_obtenerUsuarioCorreo);

    on<ContactoNombreChanged>(_onContactoNombreChanged);
    on<ContactoApellidoPaternoChanged>(_onContactoApellidoPaternoChanged);
    on<ContactoApellidoMaternoChanged>(_onContactoApellidoMaternoChanged);
    on<ContactoTelefonoChanged>(_onContactoTelefonoChanged);
    on<ContactoCorreoChanged>(_onContactoCorreoChanged);
    on<UsuarioCorreoChanged>(_onUsuarioCorreoChanged);
    on<UsuarioPasswordChanged>(_onUsuarioPasswordChanged);
    on<UsuarioConfirmPasswordChanged>(_onUsuarioConfirmPasswordChanged);
  }

  Future<void> _obtenerDatosPaciente(BuscarDatosPacienteEvent event, Emitter<PacienteState> emitter) async {
    final result = await buscarPaciente.call(NoParams());

    result.fold(
            (failure) => emitter(PacienteError(failure.toString())),
            (paciente) {
          final mapContacto = mapper.toMapContacto(paciente);
          final mapTecnica = mapper.toMapFichaTecnica(paciente);
          final mapSomatometria = mapper.toMapSomatometria(paciente);
          final mapMedica = mapper.toMapFichaMedica(paciente);
          final mapDoctor = mapper.toMapDoctor(paciente);

          final mapData = {
            ...mapContacto,
            ...mapTecnica,
            ...mapSomatometria,
            ...mapMedica
          };

          emitter(PacienteSuccess(
              mapContacto, mapTecnica, mapSomatometria, mapMedica, mapDoctor,
              mapData));
        }
    );
  }

  Future<void> _actualizarPaciente(ActualizarPacienteEvent event, Emitter<PacienteState> emitter) async {
    final result = await actualizarPaciente.call(
        PacienteUpdateRequest(
            nombre: event.nombre,
            apellidoPaterno: event.apellidoPaterno,
            apellidoMaterno: event.apellidoMaterno,
            fechaNacimiento: event.fechaNacimiento,
            genero: event.genero,
            estadoCivil: event.estadoCivil,
            nivelEstudios: event.nivelEstudios,
            numMiembrosHogar: event.numMiembrosHogar,
            tipoDiabetes: event.tipoDiabetes,
            tiempoDiabetes: event.tiempoDiabetes,
            peso: event.peso,
            talla: event.talla,
            telefono: event.telefono,
            correo: event.correo,
            factorActividad: event.factorActividad
        )
    );

    return result.fold(
            (failure) => emitter(PacienteError(failure.toString())),
            (success) => emitter(PacienteUpdateSuccess())
    );
  }

  Future<void> _obtenerUsuarioCorreo(GetUserAndEmailEvent event, Emitter<PacienteState> emitter) async {
    final usuario = await buscarUsuario.call(NoParams());
    final correo = await buscarCorreo.call(NoParams());

    emitter(UserAndEmailSuccess(usuario, correo));
  }

  void _initializeForm(InitializeFormEvent event, Emitter<PacienteState> emitter) {

    if (event.formType == FormType.contact) {
      emitter(const ContactoFormState());
    } else if (event.formType == FormType.user) {
      emitter(const UsuarioFormState());
    } else {
      emitter(const CombinedFormState(
        contactoFormState: ContactoFormState(),
        usuarioFormState: UsuarioFormState(),
      ));
    }
  }

  void _validateForm(ValidateFormEvent event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is CombinedFormState) {
      final contactoFormState = currentState.contactoFormState;
      final usuarioFormState = currentState.usuarioFormState;

      final contactoStatus = Formz.validate([
        contactoFormState.nombre,
        contactoFormState.apellidoPaterno,
        contactoFormState.apellidoMaterno,
        contactoFormState.telefono,
        contactoFormState.correo,
      ]);

      final usuarioStatus = Formz.validate([
        usuarioFormState.correo,
        usuarioFormState.newPassword,
        usuarioFormState.confirmPassword,
      ]);

      final combinedStatus =
      contactoStatus == FormzStatus.valid && usuarioStatus == FormzStatus.valid
          ? FormzStatus.valid
          : FormzStatus.invalid;

      emitter(currentState.copyWith(
        contactoFormState: contactoFormState.copyWith(status: contactoStatus),
        usuarioFormState: usuarioFormState.copyWith(status: usuarioStatus),
        status: combinedStatus,
      ));
    } else if (currentState is ContactoFormState) {
      emitter(currentState.copyWith(status: currentState.status));
    } else if (currentState is UsuarioFormState) {
      emitter(currentState.copyWith(status: currentState.status));
    }
  }

  void _onContactoNombreChanged(ContactoNombreChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is CombinedFormState) {
      final nombre = Texto.dirty(event.nombre);
      final contactoFormState = currentState.contactoFormState.copyWith(nombre: nombre);
      _validateForm(const ValidateFormEvent(FormType.both), emitter);
      emitter(currentState.copyWith(contactoFormState: contactoFormState));
    } else if (currentState is ContactoFormState) {
      final nombre = Texto.dirty(event.nombre);
      _validateForm(const ValidateFormEvent(FormType.contact), emitter);
      emitter(currentState.copyWith(nombre: nombre));
    }
  }

  void _onContactoApellidoPaternoChanged(ContactoApellidoPaternoChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is CombinedFormState) {
      final apellidoPaterno = Texto.dirty(event.apellidoPaterno);
      final contactoFormState = currentState.contactoFormState.copyWith(apellidoPaterno: apellidoPaterno);
      _validateForm(const ValidateFormEvent(FormType.both), emitter);
      emitter(currentState.copyWith(contactoFormState: contactoFormState));
    } else if (currentState is ContactoFormState) {
      final apellidoPaterno = Texto.dirty(event.apellidoPaterno);
      _validateForm(const ValidateFormEvent(FormType.contact), emitter);
      emitter(currentState.copyWith(apellidoPaterno: apellidoPaterno));
    }
  }

  void _onContactoApellidoMaternoChanged(ContactoApellidoMaternoChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is CombinedFormState) {
      final apellidoMaterno = Texto.dirty(event.apellidoMaterno);
      final contactoFormState = currentState.contactoFormState.copyWith(apellidoMaterno: apellidoMaterno);
      _validateForm(const ValidateFormEvent(FormType.both), emitter);
      emitter(currentState.copyWith(contactoFormState: contactoFormState));
    } else if (currentState is ContactoFormState) {
      final apellidoMaterno = Texto.dirty(event.apellidoMaterno);
      _validateForm(const ValidateFormEvent(FormType.contact), emitter);
      emitter(currentState.copyWith(apellidoMaterno: apellidoMaterno));
    }
  }

  void _onContactoTelefonoChanged(ContactoTelefonoChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is CombinedFormState) {
      final telefono = Telefono.dirty(event.telefono);
      final contactoFormState = currentState.contactoFormState.copyWith(telefono: telefono);
      _validateForm(const ValidateFormEvent(FormType.both), emitter);
      emitter(currentState.copyWith(contactoFormState: contactoFormState));
    } else if (currentState is ContactoFormState) {
      final telefono = Telefono.dirty(event.telefono);
      _validateForm(const ValidateFormEvent(FormType.contact), emitter);
      emitter(currentState.copyWith(telefono: telefono));
    }
  }

  void _onContactoCorreoChanged(ContactoCorreoChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is CombinedFormState) {
      final correo = event.correo.isEmpty ? const Email.pure() : Email.dirty(event.correo);
      final contactoFormState = currentState.contactoFormState.copyWith(correo: correo);
      _validateForm(const ValidateFormEvent(FormType.both), emitter);
      emitter(currentState.copyWith(contactoFormState: contactoFormState));
    } else if (currentState is ContactoFormState) {
      final correo = event.correo.isEmpty ? const Email.pure() : Email.dirty(event.correo);
      _validateForm(const ValidateFormEvent(FormType.contact), emitter);
      emitter(currentState.copyWith(correo: correo));
    }
  }

  void _onUsuarioCorreoChanged(UsuarioCorreoChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is CombinedFormState) {
      final correo = event.correo.isEmpty ? const Email.pure() : Email.dirty(event.correo);
      final usuarioFormState = currentState.usuarioFormState.copyWith(correo: correo);
      _validateForm(const ValidateFormEvent(FormType.both), emitter);
      emitter(currentState.copyWith(usuarioFormState: usuarioFormState));
    } else if (currentState is UsuarioFormState) {
      final correo = event.correo.isEmpty ? const Email.pure() : Email.dirty(event.correo);
      _validateForm(const ValidateFormEvent(FormType.user), emitter);
      emitter(currentState.copyWith(correo: correo));
    }
  }

  void _onUsuarioPasswordChanged(UsuarioPasswordChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is CombinedFormState) {
      final newPassword = Password.dirty(event.newPassword);
      final confirmPassword = ConfirmPassword.dirty(
        password: newPassword.value,
        value: currentState.usuarioFormState.confirmPassword.value,
      );

      final usuarioFormState = currentState.usuarioFormState.copyWith(
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );

      _validateForm(const ValidateFormEvent(FormType.both), emitter);

      emitter(currentState.copyWith(usuarioFormState: usuarioFormState));
    } else if (currentState is UsuarioFormState) {
      final newPassword = Password.dirty(event.newPassword);
      final confirmPassword = ConfirmPassword.dirty(
        password: newPassword.value,
        value: currentState.confirmPassword.value,
      );

      _validateForm(const ValidateFormEvent(FormType.user), emitter);
      emitter(currentState.copyWith(
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      ));
    }
  }

  void _onUsuarioConfirmPasswordChanged(UsuarioConfirmPasswordChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is CombinedFormState) {
      final confirmPassword = ConfirmPassword.dirty(
        password: currentState.usuarioFormState.newPassword.value,
        value: event.confirmPassword,
      );

      final usuarioFormState = currentState.usuarioFormState.copyWith(confirmPassword: confirmPassword);

      _validateForm(const ValidateFormEvent(FormType.both), emitter);

      emitter(currentState.copyWith(usuarioFormState: usuarioFormState));
    } else if (currentState is UsuarioFormState) {
      final confirmPassword = ConfirmPassword.dirty(
        password: currentState.newPassword.value,
        value: event.confirmPassword,
      );

      _validateForm(const ValidateFormEvent(FormType.user), emitter);
      emitter(currentState.copyWith(confirmPassword: confirmPassword));
    }
  }

}

// <>