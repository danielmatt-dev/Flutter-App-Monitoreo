import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/profile_data_row.dart';
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

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 0.5,
            color: colorScheme.background,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<PacienteBloc, PacienteState>(
                builder: (context, state) {
                  if (state is PacienteLoading){
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PacienteSuccess){
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        state.mapPaciente.entries.map((entry) {
                        return ProfileDataRow(
                            title: entry.key,
                            value: entry.value
                        );
                      }).toList()
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
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}