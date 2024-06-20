import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_personal/notificacion_personal_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/pages/profile_screens.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';

// <>
class RecommendationsScreen extends StatefulWidget {

  const RecommendationsScreen({super.key});

  @override
  State<RecommendationsScreen> createState() => _RecommendationsScreenState();

}

class _RecommendationsScreenState extends State<RecommendationsScreen> with AutomaticKeepAliveClientMixin {

  late NotificacionBloc notificacionBloc;
  late NotificacionPersonalBloc notificacionPersonalBloc;

  final _tabs = [
    const Tab(text: 'Generales',),
    const Tab(text: 'Personales',),
  ];

  final _screens = [
    const DataRecommendationsScreen(),
    const DataRecommendationsPersonalScreen()
  ];

  @override
  void initState() {
    super.initState();
    notificacionBloc = sl<NotificacionBloc>()
      ..add(ObtenerNotificaciones());
    notificacionPersonalBloc = sl<NotificacionPersonalBloc>()
      ..add(const NotificacionPersonalEvent.obtenerNotificacionesPersonales());
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
                text: 'Recomendaciones',
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
              children: _screens
          ),
        )
    );
  }

  @override
  bool get wantKeepAlive => true;

}
