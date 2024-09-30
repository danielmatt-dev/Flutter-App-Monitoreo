import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/profile/pages/profile_screens.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';

// <>
class MainRecommendationsScreen extends StatefulWidget {

  const MainRecommendationsScreen({super.key});

  @override
  State<MainRecommendationsScreen> createState() => _MainRecommendationsScreenState();

}

class _MainRecommendationsScreenState extends State<MainRecommendationsScreen> with AutomaticKeepAliveClientMixin {

  late NotificacionBloc notificacionBloc;

  final _tabs = [
    const Tab(text: 'Generales',),
    const Tab(text: 'Personales',),
  ];

  final _screens = [
    const GeneralRecommendationsScreen(),
    const PersonalRecommendationsScreen()
  ];

  @override
  void initState() {
    super.initState();
    notificacionBloc = sl<NotificacionBloc>()..add(GetNotifications());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: DefaultTabController(
          length: _tabs.length,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            appBar: AppBar(
              title: AppTextStyles.autoBodyStyle(
                  text: 'Recomendaciones',
                  color: colorScheme.primary,
                  size: SizeIcon.size22
              ),
              centerTitle: true,
              bottom: TabBar(
                tabs: _tabs,
                indicatorColor: colorScheme.primary,
                dividerColor: colorScheme.primary.withOpacity(0.2),
                labelStyle: AppTextStyles.bodyStyle(
                    color: colorScheme.primary,
                    size: SizeIcon.size18,
                ),
              ),
            ),
            body: TabBarView(
                children: _screens
            ),
          )
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}
