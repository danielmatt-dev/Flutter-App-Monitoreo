import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/profile_data_row.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/section_data_row.dart';
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

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<PacienteBloc, PacienteState>(
              builder: (context, state) {
                if (state is PacienteLoading){
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PacienteSuccess){
                  return Column(
                    children: [
                      SectionDataRow(
                          labelText: 'Ficha Médica',
                          map: state.mapFichaMedica
                      ),
                      SectionDataRow(
                        labelText: 'Doctor',
                        map: state.mapDoctor,
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