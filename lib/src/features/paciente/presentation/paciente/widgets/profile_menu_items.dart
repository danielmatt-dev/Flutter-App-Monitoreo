import 'package:app_plataforma/src/features/notificacion/presentation/pages/recommendations_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/pages/mydata_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/pages/about_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/pages/password_screen.dart';
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
      screen: MyDataScreen()
  ),
  MenuItem(
      titulo: 'Recomendaciones',
      icono: Icons.notifications_active_rounded,
      screen: RecommendationsScreen()
  ),
  MenuItem(
      titulo: 'Actualizar contraseña',
      icono: Icons.lock_clock_rounded,
      screen: PasswordScreen()
  ),
  MenuItem(
      titulo: 'Acerca De',
      icono: Icons.info,
      screen: AboutScreen()
  ),

];