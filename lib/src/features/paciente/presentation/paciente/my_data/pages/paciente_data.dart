import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/signup_screens.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/contacto_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/section_data_row.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/template_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PacienteData extends StatefulWidget {

  const PacienteData({super.key});

  @override
  State<PacienteData> createState() => _PacienteDataState();

}

class _PacienteDataState extends State<PacienteData> with AutomaticKeepAliveClientMixin<PacienteData> {

  _PacienteDataState();

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

                final map = {
                  ...state.mapContacto,
                  ...state.mapFichaTecnica,
                  ...state.mapSomatometria,
                  ...state.mapFichaMedica
                };

                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionDataRow(
                          labelText: 'Contacto',
                          map: state.mapContacto,
                          onPressed: () =>
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      ContactoScreen(map: map),
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
                                  child: Column(
                                      children: [
                                        DataSheetScreen(map: map,),
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
                                      child: SomatometriaScreen(map: map,)
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