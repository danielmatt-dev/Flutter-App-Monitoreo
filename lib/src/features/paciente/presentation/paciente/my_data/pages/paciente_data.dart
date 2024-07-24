import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/signup_screens.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/contacto_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/section_data_row.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/template_appbar.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PacienteData extends StatefulWidget {

  const PacienteData({super.key});

  @override
  State<PacienteData> createState() => _PacienteDataState();

}

class _PacienteDataState extends State<PacienteData> with AutomaticKeepAliveClientMixin<PacienteData> {

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

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<PacienteBloc, PacienteState>(
            buildWhen: (previous, current) {
              return current is PacienteSuccess;
            },
            builder: (context, state) {
              if (state is PacienteLoading){
                return const Center(child: CircularProgressIndicator());
              } else if (state is PacienteSuccess){

                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionDataRow(
                          labelText: 'Contacto',
                          map: state.mapContacto,
                          onPressed: () =>
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      ContactoScreen(map: state.mapData,),
                                  )
                              )
                      ),
                      SectionDataRow(
                        labelText: 'Ficha Técnica',
                        map: state.mapFichaTecnica,
                        onPressed: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                TemplateAppBar(
                                  title: 'Ficha Técnica',
                                  onPressed: () {

                                    final pacienteBloc = sl<PacienteBloc>();

                                    pacienteBloc.add(
                                        ActualizarPacienteEvent(
                                          nombre: state.mapData['Nombre'] ?? '',
                                          apellidoPaterno: state.mapData['Apellido paterno'] ?? '',
                                          apellidoMaterno: state.mapData['Apellido materno'] ?? '',
                                          fechaNacimiento: DateTime.parse(_nacimientoController.text),
                                          genero: _generoController.text,
                                          estadoCivil: _estadoCivilController.text,
                                          nivelEstudios: _estudiosController.text,
                                          numMiembrosHogar: int.parse(_numMiembrosController.text),
                                          tipoDiabetes: state.mapData['Tipo de diabetes'] ?? '',
                                          tiempoDiabetes: state.mapData['Tiempo con diabetes'] ?? '',
                                          peso: double.parse(state.mapData['peso'] ?? '0.0'),
                                          talla: double.parse(state.mapData['talla'] ?? '0.0'),
                                          factorActividad: state.mapData['Factor de actividad'] ?? '',
                                          telefono: state.mapData['Teléfono'] ?? '',
                                          correo: state.mapData['Correo'] ?? '',
                                        )
                                    );

                                  },
                                  child: Column(
                                      children: [
                                        DataSheetScreen(
                                          map: state.mapData,
                                          nacimientoController: _nacimientoController,
                                          generoController: _generoController,
                                          numMiembrosController: _numMiembrosController,
                                          estadoCivilController: _estadoCivilController,
                                          estudiosController: _estudiosController,
                                        ),
                                      ]
                                  ),
                                )
                            )
                        ),
                      ),
                      SectionDataRow(
                        labelText: 'Somatometría',
                        map: state.mapSomatometria,
                        onPressed: () =>
                            Navigator.push(
                                context,
                              MaterialPageRoute(builder: (context) =>
                                  TemplateAppBar(
                                      title: 'Somatometría',
                                      onPressed: () {

                                        final pacienteBloc = sl<PacienteBloc>();

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
                                            )
                                        );

                                      },
                                      child: SomatometriaScreen(
                                        map: state.mapData,
                                        pesoController: _pesoController,
                                        tallaController: _tallaController,
                                        factorController: _factorController,
                                      )
                                  )
                              )
                            ),
                      ),
                    ]
                );
              } else if (state is PacienteError) {
                return Center(child: Text(state.error));
              } else {
                return const Center(child: Text('Desconocido'));
              }
            }
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}

/*

        ActualizarPacienteEvent(
          nombre: widget.map['Nombre'] ?? '',
          apellidoPaterno: widget.map['Apellido paterno'] ?? '',
          apellidoMaterno: widget.map['Apellido materno'] ?? '',
          fechaNacimiento: DateTime.parse(widget.map['Fecha de nacimiento'] ?? ''),
          genero: widget.map['Género'] ?? '',
          estadoCivil: widget.map['estadocivil'] ?? '',
          nivelEstudios: widget.map['Nivel de estudios'] ?? '',
          numMiembrosHogar: int.parse(widget.map['Miembros del hogar'] ?? '0'),
          tipoDiabetes: widget.map['Tipo de diabetes'] ?? '',
          tiempoDiabetes: widget.map['Tiempo con diabetes'] ?? '',
          peso: double.parse(widget.map['peso'] ?? '0.0'),
          talla: double.parse(widget.map['talla'] ?? '0.0'),
          factorActividad: widget.map['Factor de actividad'] ?? '',
          telefono: widget.map['Teléfono'] ?? '',
          correo: widget.map['Correo'] ?? '',
    ));

*/