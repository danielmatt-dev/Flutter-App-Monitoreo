import 'package:app_plataforma/src/features/notificacion/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

// <>
class MenuNavigationBar extends StatefulWidget {
  const MenuNavigationBar({super.key});

  @override
  State<MenuNavigationBar> createState() => _MenuNavigationState();
}

class _MenuNavigationState extends State<MenuNavigationBar> {
  int _index = 0;

  final screens = [
    const HomeScreen(),
    const Center(child: Text('Monitoreo')),
    const Center(child: Text('Descargas')),
    const Center(child: Text('Perfil')),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: NavigationBar(
        height: height * 0.10,
        selectedIndex: _index,
        animationDuration: const Duration(seconds: 1),
        onDestinationSelected: (index) => setState(() => _index = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month),
            label: 'Monitoreo',
          ),
          NavigationDestination(
            icon: Icon(Icons.download_outlined),
            selectedIcon: Icon(Icons.download),
            label: 'Descargas',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
