import 'package:app_plataforma/src/features/direccion/presentation/widgets/text_field_custom.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/DatosPersonalesScreen.dart';
import 'package:flutter/material.dart';

class DatosDos extends StatefulWidget {
  const DatosDos({super.key});

  @override
  State<DatosDos> createState() => _DatosDosState();

}

class _DatosDosState extends State<DatosDos> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPaternoController = TextEditingController();
  final TextEditingController _apellidoMaternoController = TextEditingController();
  final TextEditingController _fechaNacimientoController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _tallaController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _claveDoctorController = TextEditingController();
  final TextEditingController _nombreTratamientoController = TextEditingController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {

    final camposTexto1 = [
      CampoTexto(id: 1, label: 'Nombre(s)', controller: _nombreController),
      CampoTexto(id: 2, label: 'Apellido Paterno', controller: _apellidoPaternoController),
      CampoTexto(id: 3, label: 'Apellido Materno', controller: _apellidoMaternoController),
      CampoTexto(id: 4, label: 'Fecha de Nacimiento', controller: _fechaNacimientoController),
      CampoTexto(id: 5, label: 'Peso', controller: _pesoController),
      CampoTexto(id: 6, label: 'Clave del Doctor', controller: _claveDoctorController),
    ];

    final camposTexto2 = [
      CampoTexto(id: 7, label: 'Talla', controller: _tallaController),
      CampoTexto(id: 8, label: 'Correo', controller: _correoController),
      CampoTexto(id: 9, label: 'Contraseña', controller: _passwordController, obscureText: true),
      CampoTexto(id: 10, label: 'Nombre del Tratamiento', controller: _nombreTratamientoController),
    ];

    final pages = [camposTexto1, camposTexto2];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Personales'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: pages[_currentPage].map((campo) {
                  return TextFieldCustom(
                    controller: campo.controller,
                    labelText: campo.label,
                    isInvalid: false,
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage != 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentPage--;
                      });
                    },
                    child: const Text('ANTERIOR'),
                  ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_currentPage < pages.length - 1) {
                        _currentPage++;
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const DatosPersonalesScreen()),
                        );
                      }
                    });
                  },
                  child: const Text('SIGUIENTE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CampoTexto {
  final int id;
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  CampoTexto({
    required this.id,
    required this.label,
    required this.controller,
    this.obscureText = false,
  });
}
