import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/ficha_medica_section.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/template_appbar.dart';
import 'package:flutter/material.dart';

class FichaMedicaScreen extends StatefulWidget {

  final Map<String, String> map;

  const FichaMedicaScreen({
    super.key,
    required this.map
  });

  @override
  State<FichaMedicaScreen> createState() => _FichaMedicaScreenState();
}

class _FichaMedicaScreenState extends State<FichaMedicaScreen> {

  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _tiempoController = TextEditingController();

  @override
  void initState() {
    _tipoController.text = widget.map['Tipo de diabetes'] ?? '';
    _tiempoController.text = widget.map['Tiempo con diabetes'] ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return TemplateAppBar(
        title: 'Ficha Médica',
        onPressed: () {
          print(_tipoController.text);
          print(_tiempoController.text);
        },
        child: FichaMedicaSection(
          tiempoController: _tiempoController,
          tipoController: _tipoController,
        ),
      );
  }
}