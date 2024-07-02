import 'package:app_plataforma/src/core/menu/menu_navigation_controller.dart';
import 'package:app_plataforma/src/core/theme/app_theme.dart';
import 'package:app_plataforma/src/core/theme/cubit/theme_cubit.dart';
import 'package:app_plataforma/src/features/direccion/presentation/bloc/direccion_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_personal/notificacion_personal_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/bloc/password_bloc.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/cubit/preguntas_cubit.dart';
import 'package:app_plataforma/src/features/valor_glucosa/presentation/bloc/valor_glucosa_bloc.dart';
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
          BlocProvider<PasswordBloc>(
            create: (context) => sl<PasswordBloc>(),
          ),
          BlocProvider<DireccionBloc>(
            create: (context) => sl<DireccionBloc>(),
          ),
          BlocProvider<NotificacionPersonalBloc>(
            create: (context) => sl<NotificacionPersonalBloc>(),
          ),
          BlocProvider<ThemeCubit>(
              create: (context) => sl<ThemeCubit>()
          ),
          BlocProvider<PreguntasCubit>(
              create: (context) => sl<PreguntasCubit>(),
          ),
        ],
        child: const MyApp()
    );
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state.when(
          success: (isDarkMode) => isDarkMode,
        );

        final height = MediaQuery.of(context).size.height;

        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            SfGlobalLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('es'),
            Locale('en'),
          ],
          locale: const Locale('es'),
          debugShowCheckedModeBanner: false,
          theme: AppTheme(isDarkMode: isDarkMode).getThemeData(height),
          home: const MenuNavigationController(),
        );
      },
    );
  }
}
