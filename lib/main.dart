import 'package:app_plataforma/src/core/menu/menu_navigation_controller.dart';
import 'package:app_plataforma/src/core/theme/app_theme.dart';
import 'package:app_plataforma/src/core/theme/cubit/theme_cubit.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  runApp(const BlocProviders());
}

class BlocProviders extends StatelessWidget {

  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NotificacionBloc>(
              create: (context) => sl<NotificacionBloc>()
          ),
          BlocProvider<PacienteBloc>(
            create: (context) => sl<PacienteBloc>(),
          ),
          BlocProvider(create: (context) => sl<ThemeCubit>())
        ],
        child: const MyApp()
    );
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final theme = sl<ThemeCubit>().state;

    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        SfGlobalLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('es'),
        Locale('en'),
      ],
      locale: const Locale('es'),
      debugShowCheckedModeBanner: false,
      theme: AppTheme( isDarkMode: theme.isDarkMode ).getThemeData(height),
      home: const MenuNavigationController(),
    );
  }

}
