import 'package:app_plataforma/src/core/menu/bottom_navigation_bar.dart';
import 'package:app_plataforma/src/core/theme/app_theme.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/promedio/presentation/bloc/promedio_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotificacionBloc>(
          create: (context) => sl<NotificacionBloc>()
            ..add(ObtenerNotificacionPorId(1)),
        ),
        BlocProvider<PromedioBloc>(
          create: (context) {
            final bloc = sl<PromedioBloc>();
            bloc.add(ObtenerPromedioGlucosa());
            bloc.add(ObtenerPromedioSistolica());
            bloc.add(ObtenerPromedioDiastolica());
            return bloc;
            },
        ),
      ],
      child: MaterialApp(
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
        theme: AppTheme().getLightTheme(context),
        home: const BottonNavigationBarController(),
      ),
    );
  }
}
