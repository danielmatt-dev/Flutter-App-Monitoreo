import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/cubit/paciente_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/ficha_medica_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/section_data_row.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorData extends StatefulWidget {
  const DoctorData({super.key});

  @override
  State<DoctorData> createState() => _DoctorDataState();
}

class _DoctorDataState extends State<DoctorData> {

  final pacienteBloc = sl<PacienteBloc>();
  final pacienteCubit = sl<PacienteCubit>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
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
                // Aquí puedes limpiar los controladores si los tuvieras.
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
                    children: [
                      SectionDataRow(
                        labelText: 'Ficha Médica',
                        map: state.mapFichaMedica,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FichaMedicaScreen(
                                map: state.mapData,
                              ),
                            ),
                          );
                        },
                      ),
                      SectionDataRow(
                        labelText: 'Doctor',
                        map: state.mapDoctor,
                        enabled: false,
                      ),
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
    );
  }

}