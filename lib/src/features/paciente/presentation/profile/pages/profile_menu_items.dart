import 'package:app_plataforma/src/features/paciente/presentation/profile/pages/profile_screens.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/pages/main_about_screen.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/pages/splash_test_screen.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/pages/test_screen.dart';
import 'package:flutter/material.dart';

class MenuItem {

  final String titulo;
  final IconData icono;
  final Widget screen;

  const MenuItem({
    required this.titulo,
    required this.icono,
    required this.screen
  });

}

const profileMenuItems = [
  MenuItem(
      titulo: 'Mis datos',
      icono: Icons.health_and_safety,
      screen: MainMyDataScreen()
  ),
  MenuItem(
      titulo: 'Recomendaciones',
      icono: Icons.notifications_active_rounded,
      screen: MainRecommendationsScreen()
  ),
  MenuItem(
      titulo: 'Cambiar contraseña',
      icono: Icons.lock_clock_rounded,
      screen: UpdatePasswordScreen()
  ),
  MenuItem(
      titulo: 'Cambiar dirección',
      icono: Icons.edit_location,
      screen: SplashIconScreen(
        titles: [
          'Objetivo',
          'Confidencialidad',
        ],
        descriptions: [
          'Identificar los aspectos relacionados con el autocuidado de la diabetes para poder ofrecer alternativas para su mejora',
          'Tenga la confianza de responder con sinceridad todas las preguntas para identificar más claramente sus necesidades',
        ],
        icons: [
          Icons.fact_check_rounded,
          Icons.health_and_safety_rounded
        ],
        nextScreen: TestScreen(),
      )
  ),
  MenuItem(
      titulo: 'Acerca De',
      icono: Icons.info,
      screen: MainAboutScreen()
      //screen: AboutScreen(),
  ),

];