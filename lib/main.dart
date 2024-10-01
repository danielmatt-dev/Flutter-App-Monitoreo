import 'package:app_plataforma/src/core/menu/menu_navigation_controller.dart';
import 'package:app_plataforma/src/core/theme/app_theme.dart';
import 'package:app_plataforma/src/core/theme/cubit/theme_cubit.dart';
import 'package:app_plataforma/src/features/comentario/presentation/cubit/comentario_cubit.dart';
import 'package:app_plataforma/src/features/direccion/presentation/bloc/direccion_bloc.dart';
import 'package:app_plataforma/src/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:app_plataforma/src/features/firebase/service/push_notification_service.dart';
import 'package:app_plataforma/src/features/mediciones/presentation/cubit/medicion_cubit.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/cubit/auth_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/cubit/paciente_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/bloc/password_bloc.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/cubit/preguntas_cubit.dart';
import 'package:app_plataforma/src/features/registro_respuestas/presentation/cubit/registro_respuestas_cubit.dart';
import 'package:app_plataforma/src/features/tratamiento/presentation/cubit/tratamiento_cubit.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/bloc/valor_bloc.dart';
import 'package:app_plataforma/src/shared/pages/no_connection_internet.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();

  var connectivityResult = await Connectivity().checkConnectivity();

  Widget initialScreen;

  if (connectivityResult == ConnectivityResult.none) {
    initialScreen = const NoConnectionInternet();
  } else {
    await PushNotificationService.initializeApp();
    initialScreen = const MenuNavigationController();
  }

  runApp(BlocProviders(initialWidget: initialScreen));
}

class BlocProviders extends StatelessWidget {

  final Widget initialWidget;

  const BlocProviders({super.key, required this.initialWidget});

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
          BlocProvider<ThemeCubit>(
              create: (context) => sl<ThemeCubit>()
          ),
          BlocProvider<PreguntasCubit>(
              create: (context) => sl<PreguntasCubit>(),
          ),
          BlocProvider<AuthCubit>(
              create: (context) => sl<AuthCubit>()
          ),
          BlocProvider<RegistroRespuestasCubit>(
              create: (context) => sl<RegistroRespuestasCubit>()
          ),
          BlocProvider<ValorBloc>(
            create: (context) => sl<ValorBloc>(),
          ),
          BlocProvider<MedicionCubit>(
              create: (context) => sl<MedicionCubit>(),
          ),
          BlocProvider<TratamientoCubit>(
            create: (context) => sl<TratamientoCubit>(),
          ),
          BlocProvider<DoctorCubit>(
            create: (context) => sl<DoctorCubit>(),
          ),
          BlocProvider<PacienteCubit>(
            create: (context) => sl<PacienteCubit>(),
          ),
          BlocProvider<ComentarioCubit>(
            create: (context) => sl<ComentarioCubit>(),
          ),
        ],
        child: MyApp(initialWidget: initialWidget)
    );
  }

}

class MyApp extends StatelessWidget {

  final Widget initialWidget;

  const MyApp({super.key, required this.initialWidget});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
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
          theme: AppTheme(isDarkMode: state.isDarkMode).getThemeData(),
          home: initialWidget,
        );
      },
    );
  }
}
// <>