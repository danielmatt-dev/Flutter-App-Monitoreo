import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/direccion/presentation/bloc/direccion_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/cubit/paciente_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/doctor_data.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/paciente_data.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';

// <>
class MainMyDataScreen extends StatefulWidget {

  const MainMyDataScreen({super.key});

  @override
  State<MainMyDataScreen> createState() => _MainMyDataScreenState();

}

class _MainMyDataScreenState extends State<MainMyDataScreen> with AutomaticKeepAliveClientMixin {

  final pacienteBloc = sl<PacienteBloc>();
  late PacienteCubit pacienteCubit;
  late DireccionBloc direccionBloc;

  final _screens = [
    const PacienteData(),
    const DoctorData(),
  ];

  @override
  void initState() {
    super.initState();
    pacienteCubit = sl<PacienteCubit>()..buscarDatosPaciente();
    direccionBloc = sl<DireccionBloc>()..add(BuscarDireccionPacienteEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final colorScheme = Theme.of(context).colorScheme;

    final tabs = [
        Tab(
          child: AppTextStyles.autoBodyStyle(
              text: 'Ficha Técnica',
              color: colorScheme.primary,
              size: SizeIcon.size16
          ),
        ),
        Tab(
          child: AppTextStyles.autoBodyStyle(
              text: 'Médicos',
              color: colorScheme.primary,
              size: SizeIcon.size16
          ),
        ),
      ];

    return SafeArea(
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          appBar: AppBar(
            title: AppTextStyles.autoBodyStyle(
              text: 'Mis datos',
              color: colorScheme.primary,
              size: SizeIcon.size22,
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: tabs,
              dividerColor: colorScheme.primary.withOpacity(0.2),
            ),
          ),
          body: TabBarView(
              children: _screens,
            ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}
