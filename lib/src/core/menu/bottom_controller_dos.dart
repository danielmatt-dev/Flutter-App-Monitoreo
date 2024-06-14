import 'package:app_plataforma/src/features/notificacion/presentation/pages/home_screen.dart';
import 'package:app_plataforma/src/features/valor_response/presentation/pages/monitoring_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationDos extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() => _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationDos> {
  final List<Widget> pages = [
    FirstPage(
      key: PageStorageKey('Page1'),
    ),
    SecondPage(
      key: PageStorageKey('Page2'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    onTap: (int index) => setState(() => _selectedIndex = index),
    currentIndex: selectedIndex,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.add), label: 'First Page'),
      BottomNavigationBarItem(
          icon: Icon(Icons.list), label: 'Second Page'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}

class FirstPage extends StatelessWidget {

  int _contador = 0;

  FirstPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _contador == 0 ? print('Creando page 1') : print('Ya estuvimos aqui 1');
    _contador++;

    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text('Lorem Ipsum'),
          subtitle: Text('$index'),
        );
      }),
    );
  }
}

class SecondPage extends StatelessWidget {

  int _contador = 0;

  SecondPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _contador == 0 ? print('Creando page 2') : print('Ya estuvimos aqui 2');

    _contador++;

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text('Lorem Ipsum'),
          subtitle: Text('$index'),
        );
      }),
    );
  }
}
