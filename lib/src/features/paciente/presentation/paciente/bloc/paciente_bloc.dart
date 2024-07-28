import 'package:app_plataforma/src/features/auth_response/domain/usecases/buscar_correo.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/buscar_usuario.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/mapper/paciente_map_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_update_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/actualizar_paciente.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_paciente.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/crear_cuenta.dart';
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
  final CrearCuenta crearCuenta;

  PacienteBloc({
    required this.buscarPaciente,
    required this.actualizarPaciente,
    required this.mapper,
    required this.buscarUsuario,
    required this.buscarCorreo,
    required this.crearCuenta
  }) : super(PacienteInicial()) {
    on<BuscarDatosPacienteEvent>(_obtenerDatosPaciente);
    on<ActualizarPacienteEvent>(_actualizarPaciente);
    on<GetUserAndEmailEvent>(_obtenerUsuarioCorreo);
    on<CrearCuentaEvent>(_crearCuenta);
    on<InitializeFormsEvent>(_onInitializeForm);
    on<ContactoNombreChanged>(_onContactoNombreChanged);
    on<ContactoApellidoPaternoChanged>(_onContactoApellidoPaternoChanged);
    on<ContactoApellidoMaternoChanged>(_onContactoApellidoMaternoChanged);
    on<ContactoTelefonoChanged>(_onContactoTelefonoChanged);
    on<ContactoCorreoChanged>(_onContactoCorreoChanged);
    on<UsuarioCorreoChanged>(_onUsuarioCorreoChanged);
    on<UsuarioPasswordChanged>(_onUsuarioPasswordChanged);
    on<UsuarioConfirmPasswordChanged>(_onUsuarioConfirmPasswordChanged);
  }

  Future<void> _crearCuenta(CrearCuentaEvent event,
      Emitter<PacienteState> emitter) async {
    final result = await crearCuenta.call(
        PacienteRequest(
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
            password: event.password,
            factorActividad: event.factorActividad,
            claveDoctor: event.claveDoctor,
            nombreTratamiento: event.nombreTratamiento
        )
    );

    return result.fold(
            (failure) => emitter(PacienteError(failure.toString())),
            (success) => emitter(SignUpSuccess())
    );
  }

  Future<void> _obtenerDatosPaciente(BuscarDatosPacienteEvent event,
      Emitter<PacienteState> emitter) async {
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

  Future<void> _actualizarPaciente(ActualizarPacienteEvent event,
      Emitter<PacienteState> emitter) async {
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

  Future<void> _obtenerUsuarioCorreo(GetUserAndEmailEvent event,
      Emitter<PacienteState> emitter) async {
    final usuario = await buscarUsuario.call(NoParams());
    final correo = await buscarCorreo.call(NoParams());

    emitter(UserAndEmailSuccess(usuario, correo));
  }

  void _onInitializeForm(InitializeFormsEvent event, Emitter<PacienteState> emitter) {

    if(event.isUser) {
      emitter(const UsuarioFormState());
      return;
    }

    emitter(const ContactoFormState());
  }

  void _onContactoNombreChanged(ContactoNombreChanged event, Emitter<PacienteState> emitter,) {

    print('Nombre en contacto validando');

    final currentState = state;

    if(currentState is ContactoFormState){

      final nombre = Texto.dirty(event.nombre);
      emitter(currentState.copyWith(
        nombre: nombre,
        status: Formz.validate([nombre, currentState.nombre])
      ));

    }

  }

  void _onContactoApellidoPaternoChanged(ContactoApellidoPaternoChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is ContactoFormState) {
      final apellidoPaterno = Texto.dirty(event.apellidoPaterno);
      emitter(
        currentState.copyWith(
          apellidoPaterno: apellidoPaterno,
          status: Formz.validate([
            currentState.nombre,
            apellidoPaterno,
            currentState.apellidoMaterno,
            currentState.telefono,
            currentState.correo,
          ]),
        ),
      );
    }
  }

  void _onContactoApellidoMaternoChanged(ContactoApellidoMaternoChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is ContactoFormState) {
      final apellidoMaterno = Texto.dirty(event.apellidoMaterno);
      emitter(
        currentState.copyWith(
          apellidoMaterno: apellidoMaterno,
          status: Formz.validate([
            currentState.nombre,
            currentState.apellidoPaterno,
            apellidoMaterno,
            currentState.telefono,
            currentState.correo,
          ]),
        ),
      );
    }
  }

  void _onContactoTelefonoChanged(ContactoTelefonoChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is ContactoFormState) {
      final telefono = Telefono.dirty(event.telefono);
      emitter(
        currentState.copyWith(
          telefono: telefono,
          status: Formz.validate([
            currentState.nombre,
            currentState.apellidoPaterno,
            currentState.apellidoMaterno,
            telefono,
            currentState.correo,
          ]),
        ),
      );
    }
  }

  void _onContactoCorreoChanged(ContactoCorreoChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is ContactoFormState) {
      final correo = event.correo.isEmpty ? const Email.pure() : Email.dirty(event.correo);
      emitter(
        currentState.copyWith(
          correo: correo,
          status: Formz.validate([
            currentState.nombre,
            currentState.apellidoPaterno,
            currentState.apellidoMaterno,
            currentState.telefono,
            correo,
          ]),
        ),
      );
    }
  }

  void _onUsuarioCorreoChanged(UsuarioCorreoChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is UsuarioFormState) {
      final correo = event.correo.isEmpty ? const Email.pure() : Email.dirty(event.correo);
      emitter(
        currentState.copyWith(
          correo: correo,
          status: Formz.validate([
            correo,
            currentState.newPassword,
            currentState.confirmPassword,
          ]),
        ),
      );
    }
  }

  void _onUsuarioPasswordChanged(UsuarioPasswordChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is UsuarioFormState) {
      final newPassword = Password.dirty(event.newPassword);
      emitter(
        currentState.copyWith(
          newPassword: newPassword,
          status: Formz.validate([
            currentState.correo,
            newPassword,
            currentState.confirmPassword,
          ]),
        ),
      );
    }
  }

  void _onUsuarioConfirmPasswordChanged(UsuarioConfirmPasswordChanged event, Emitter<PacienteState> emitter) {
    final currentState = state;

    if (currentState is UsuarioFormState) {
      final confirmPassword = ConfirmPassword.dirty(
        password: currentState.newPassword.value,
        value: event.confirmPassword,
      );
      emitter(
        currentState.copyWith(
          confirmPassword: confirmPassword,
          status: Formz.validate([
            currentState.correo,
            currentState.newPassword,
            confirmPassword,
          ]),
        ),
      );
    }
  }

}

// <>