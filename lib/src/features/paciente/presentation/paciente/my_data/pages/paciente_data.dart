import 'package:app_plataforma/src/features/direccion/presentation/bloc/direccion_bloc.dart';
import 'package:app_plataforma/src/features/direccion/presentation/pages/direccion_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/signup_screens.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/cubit/paciente_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/contacto_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/section_data_row.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/template_appbar.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class PacienteData extends StatefulWidget {
  const PacienteData({super.key});

  @override
  State<PacienteData> createState() => _PacienteDataState();
}

class _PacienteDataState extends State<PacienteData> {

  final pacienteBloc = sl<PacienteBloc>();
  final pacienteCubit = sl<PacienteCubit>();
  final direccionBloc = sl<DireccionBloc>();

  final TextEditingController _nacimientoController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _numMiembrosController = TextEditingController();
  final TextEditingController _estadoCivilController = TextEditingController();
  final TextEditingController _estudiosController = TextEditingController();

  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _tallaController = TextEditingController();
  final TextEditingController _factorController = TextEditingController();

  @override
  void dispose() {
    _nacimientoController.dispose();
    _generoController.dispose();
    _numMiembrosController.dispose();
    _estadoCivilController.dispose();
    _estudiosController.dispose();

    _pesoController.dispose();
    _tallaController.dispose();
    _factorController.dispose();
    super.dispose();
  }

  void clearControllers() {
    _nacimientoController.clear();
    _generoController.clear();
    _numMiembrosController.clear();
    _estadoCivilController.clear();
    _estudiosController.clear();
    _pesoController.clear();
    _tallaController.clear();
    _factorController.clear();
  }

  bool esMayorDeEdad(String fecha){
    DateTime fechaNacimiento = DateTime.parse(fecha);
    DateTime fechaActual = DateTime.now();
    int edad = fechaActual.year - fechaNacimiento.year;

    if (fechaActual.month < fechaNacimiento.month || (fechaActual.month == fechaNacimiento.month && fechaActual.day < fechaNacimiento.day)) {
      edad--;
    }

    return edad >= 18;
  }

  Future<void> _refreshData() async {
    pacienteCubit.buscarDatosPaciente();
    await Future.delayed(const Duration(seconds: 2));
  }

  _updatePacienteFichaTecnica(PacienteCubitSuccess state){
    if (!esMayorDeEdad(_nacimientoController.text)) {
      CustomSnackbar.show(
          context: context,
          typeMessage: TypeMessage.warning,
          title: 'Fecha de nacimiento',
          description: 'Debe ser mayor de edad para continuar');
      return;
    }

    pacienteBloc.add(
      ActualizarPacienteEvent(
        nombre: state.mapData['Nombre'] ?? '',
        apellidoPaterno: state.mapData['Apellido paterno'] ?? '',
        apellidoMaterno: state.mapData['Apellido materno'] ?? '',
        fechaNacimiento: DateTime.parse(_nacimientoController.text),
        genero: _generoController.text,
        estadoCivil: mapEstado.entries.firstWhere(
                (entry) => entry.value == _estadoCivilController.text,
            orElse: () => const MapEntry('', '') )
            .key,
        nivelEstudios: _estudiosController.text,
        numMiembrosHogar: int.parse(_numMiembrosController.text),
        tipoDiabetes: state.mapData['Tipo de diabetes'] ?? '',
        tiempoDiabetes: state.mapData['Tiempo con diabetes'] ?? '',
        peso: double.parse(state.mapData['peso'] ?? '0.0'),
        talla: double.parse(state.mapData['talla'] ?? '0.0'),
        factorActividad: state.mapData['Factor de actividad'] ?? '',
        telefono: state.mapData['Teléfono'] ?? '',
        correo: state.mapData['Correo'] ?? '',
      ),
    );

  }

  _updatePacienteSomatometria(PacienteCubitSuccess state){
    pacienteBloc.add(
      ActualizarPacienteEvent(
        nombre: state.mapData['Nombre'] ?? '',
        apellidoPaterno: state.mapData['Apellido paterno'] ?? '',
        apellidoMaterno: state.mapData['Apellido materno'] ?? '',
        fechaNacimiento: DateTime.parse(state.mapData['Fecha de nacimiento'] ?? ''),
        genero: state.mapData['Género'] ?? '',
        estadoCivil: state.mapData['estadocivil'] ?? '',
        nivelEstudios: state.mapData['Nivel de estudios'] ?? '',
        numMiembrosHogar: int.parse(state.mapData['Miembros del hogar'] ?? '0'),
        tipoDiabetes: state.mapData['Tipo de diabetes'] ?? '',
        tiempoDiabetes: state.mapData['Tiempo con diabetes'] ?? '',
        peso: double.parse(_pesoController.text),
        talla: double.parse(_tallaController.text),
        factorActividad: _factorController.text,
        telefono: state.mapData['Teléfono'] ?? '',
        correo: state.mapData['Correo'] ?? '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocListener<PacienteBloc, PacienteState>(
              bloc: pacienteBloc,
              listener: (context, state) {
                if (state is PacienteUpdateSuccess) {
                  CustomSnackbar.show(
                    context: context,
                    typeMessage: TypeMessage.success,
                    title: 'Éxito',
                    description: 'Paciente actualizado correctamente',
                  );
                  clearControllers();
                  Navigator.pop(context);
                }
                if (state is PacienteError) {
                  CustomSnackbar.show(
                    context: context,
                    typeMessage: TypeMessage.error,
                    title: 'Error',
                    description: 'Vuelva a intentarlo más tarde',
                  );
                }
              },
              child: BlocBuilder<PacienteCubit, PacienteCubitState>(
                bloc: pacienteCubit,
                builder: (context, state) {
                  if (state is PacienteCubitLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PacienteCubitSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionDataRow(
                          labelText: 'Contacto',
                          map: state.mapContacto,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactoScreen(map: state.mapData,),
                            ),
                          ),
                        ),
                        SectionDataRow(
                          labelText: 'Ficha Técnica',
                          map: state.mapFichaTecnica,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TemplateAppBar(
                                title: 'Ficha Técnica',
                                onPressed: () => _updatePacienteFichaTecnica,
                                child: DataSheetScreen(
                                  map: state.mapData,
                                  nacimientoController: _nacimientoController,
                                  generoController: _generoController,
                                  numMiembrosController: _numMiembrosController,
                                  estadoCivilController: _estadoCivilController,
                                  estudiosController: _estudiosController,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SectionDataRow(
                          labelText: 'Somatometría',
                          map: state.mapSomatometria,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TemplateAppBar(
                                title: 'Somatometría',
                                onPressed: () => _updatePacienteSomatometria,
                                child: SomatometriaScreen(
                                  map: state.mapData,
                                  pesoController: _pesoController,
                                  tallaController: _tallaController,
                                  factorController: _factorController,
                                ),
                              ),
                            ),
                          ),
                        ),
                        BlocBuilder<DireccionBloc, DireccionFormState>(
                          builder: (context, state) {
                            if(state.status.isSubmissionSuccess && state.direccionMap.isNotEmpty) {
                              return SectionDataRow(
                                labelText: 'Dirección',
                                map: state.direccionMap,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DireccionScreen()
                                    )
                                ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        )
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

}
