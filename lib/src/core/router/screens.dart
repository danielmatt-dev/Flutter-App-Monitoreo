import 'package:flutter/material.dart';

// Define other screens as usual
class DataScreen extends StatelessWidget {

  static const String nombre = 'data_screen';

  const DataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis datos'),
      ),
      body: const Center(
        child: Text('Pantalla de mis datos'),
      ),
    );
  }
}

class RecommendationsScreen extends StatelessWidget {

  static const String nombre = 'recommendations_screen';

  const RecommendationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recomendaciones'),
      ),
      body: const Center(
        child: Text('Pantalla de recomendaciones'),
      ),
    );
  }
}

class PasswordScreen extends StatelessWidget {

  static const String nombre = 'password_screen';

  const PasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizar contraseña'),
      ),
      body: const Center(
        child: Text('Pantalla de actualizar contraseña'),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {

  static const String nombre = 'about_screen';

  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca De'),
      ),
      body: const Center(
        child: Text('Pantalla de acerca de'),
      ),
    );
  }
}