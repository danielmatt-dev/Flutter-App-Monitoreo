import 'package:flutter/material.dart';

class MenuItem {

  final String titulo;
  final String url;
  final IconData icono;

  const MenuItem({
    required this.titulo,
    required this.url,
    required this.icono,
  });

}

const profileMenuItems = [
  MenuItem(
      titulo: 'Mis datos',
      url: '/data',
      icono: Icons.health_and_safety
  ),
  MenuItem(
      titulo: 'Recomendaciones',
      url: '/recommendations ',
      icono: Icons.notifications_active_rounded
  ),
  MenuItem(
      titulo: 'Actualizar contraseña',
      url: '/password',
      icono: Icons.lock_clock_rounded
  ),
  MenuItem(
      titulo: 'Acerca De',
      url: '/about',
      icono: Icons.info
  ),

];