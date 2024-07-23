import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/signup_screens.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/section_data_row.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/template_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorData extends StatefulWidget {

  const DoctorData({super.key});

  @override
  State<DoctorData> createState() => _DoctorDataState();

}

class _DoctorDataState extends State<DoctorData> with AutomaticKeepAliveClientMixin<DoctorData> {
  
  _DoctorDataState();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final height = MediaQuery.of(context).size.height;

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
                    children: [
                      SectionDataRow(
                          labelText: 'Ficha Médica',
                          map: state.mapFichaMedica,
                        onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TemplateAppBar(
                                          title: 'Ficha Médica',
                                          child: SingleChildScrollView(
                                            physics: const BouncingScrollPhysics(),
                                            child: Column(
                                              children: [
                                                TemplateQuestion(
                                                    question: 'Tipo de diabetes',
                                                    answers: tipoOpciones,
                                                    onSelectedResponse: (value) {}
                                                ),
                                                TemplateQuestion(
                                                    question: 'Tiempo con diabetes',
                                                    answers: tiempoOpciones,
                                                    onSelectedResponse: (value) {}
                                                ),
                                                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.015)
                                              ],
                                            ),
                                          ),
                                        )
                                )
                            );
                        },
                      ),
                      SectionDataRow(
                        labelText: 'Doctor',
                        map: state.mapDoctor,
                        enabled: false,
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