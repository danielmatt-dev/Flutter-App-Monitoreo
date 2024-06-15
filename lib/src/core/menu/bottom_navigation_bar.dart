import 'package:app_plataforma/src/features/notificacion/presentation/pages/home_screen.dart';
import 'package:app_plataforma/src/features/valor_response/presentation/pages/monitoring_screen.dart';
import 'package:flutter/material.dart';

// <>
class BottonNavigationBarController extends StatefulWidget {

  const BottonNavigationBarController({super.key});

  @override
  State<BottonNavigationBarController> createState() => _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState extends State<BottonNavigationBarController> {

  late int _selectedIndex;
  late List<Widget> _screens;
  late PageController _pageController;

  @override
  void initState(){
    super.initState();
    _selectedIndex = 0;

    _screens = [
      const HomeScreen(),
      const MonitoringScreen(),
      //const DownloadScreen(),
      //const ProfileScreen()
    ];

    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _screens,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: height * 0.10,
        selectedIndex: _selectedIndex,
        animationDuration: const Duration(seconds: 1),
        onDestinationSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.jumpToPage(index);
        }),
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
