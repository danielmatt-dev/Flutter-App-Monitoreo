import 'package:app_plataforma/src/core/menu/screens.dart';
import 'package:flutter/material.dart';

// <>
class MenuNavigationController extends StatefulWidget {

  const MenuNavigationController({super.key});

  @override
  State<MenuNavigationController> createState() => _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState extends State<MenuNavigationController> {

  late int _selectedIndex;
  late List<Widget> _screens;
  late List<AppBarCustom> _appBars;

  late PageController _pageController;

  @override
  void initState(){
    super.initState();
    _selectedIndex = 0;

    _appBars = [
      AppBarCustom(
        title: 'Bienvenido!',
        percent: 0.04,
        leading: Image.asset(
          'assets/logo.png',
          height: 50,
        )
      ),
      const AppBarCustom(title: 'Monitoreo'),
      const AppBarCustom(title: 'Descargas'),
      const AppBarCustom(title: 'Perfil'),
    ];

    _screens = [
      const HomeScreen(),
      const MonitoringScreen(),
      const DownloadScreen(),
      const ProfileScreen()
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        appBar: _appBars[_selectedIndex],
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: _screens.length,
            reverse: false,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return _screens[index];
            },
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
      ),
    );
  }

}
