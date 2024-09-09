import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/cubit/paciente_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/ficha_medica_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/section_data_row.dart';
import 'package:app_plataforma/src/features/tratamiento/presentation/cubit/tratamiento_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
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
  final tratamientoCubit = sl<TratamientoCubit>();

  Future<void> _refreshData() async {
    pacienteCubit.buscarDatosPaciente();
    await Future.delayed(const Duration(seconds: 2));
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
                      BlocBuilder<TratamientoCubit, TratamientoState>(
                        bloc: tratamientoCubit..buscarTratamientosDelPaciente(),
                          builder: (context, state) {
                            if (state is TratamientoError) {
                              CustomSnackbar.show(
                                context:  context,
                                typeMessage: TypeMessage.error,
                                title: MessagesSnackbar.error,
                                description: MessagesSnackbar.messageConnectionError,
                              );
                              return const SizedBox.shrink();
                            } else if (state is TratamientoListSuccess) {
                              return SectionDataRow(
                                labelText: 'Tratamientos',
                                map: state.tratamientos,
                                enabled: false,
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                        }),
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