import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/profile/pages/profile_screens.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';

// <>
class MyDataScreen extends StatefulWidget {

  const MyDataScreen({super.key});

  @override
  State<MyDataScreen> createState() => _MyDataScreenState();

}

class _MyDataScreenState extends State<MyDataScreen> with AutomaticKeepAliveClientMixin {

  late PacienteBloc pacienteBloc;

  final _tabs = [
    const Tab(text: 'Ficha Técnica'),
    const Tab(text: 'Médicos'),
  ];

  final _screens = [
    const PacienteData(),
    const DoctorData(),
  ];

  @override
  void initState() {
    super.initState();
    pacienteBloc =  sl<PacienteBloc>()
      ..add(const BuscarDatosPacienteEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: AppTextStyles.autoBodyStyle(
              text: 'Mis datos',
              color: colorScheme.primary,
              height: height,
              percent: 0.03
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          children: _screens,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}
