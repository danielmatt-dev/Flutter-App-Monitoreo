import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/signup_screens.dart';
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

    final height = MediaQuery.of(context).size.height;

    return TemplateAppBar(
        title: 'Ficha Médica',
        onPressed: () {
          print(_tipoController.text);
          print(_tiempoController.text);
        },
        child: Column(
          children: [
            TemplateQuestion(
              question: 'Tipo de diabetes',
              answers: tipoOpciones,
              selectedResponse: _tipoController.text,
              onSelectedResponse: (value) {
                setState(() {
                  _tipoController.text = tipoOpciones[value];
                });
              },
            ),
            TemplateQuestion(
              question: 'Tiempo con diabetes',
              answers: tiempoOpciones,
              selectedResponse: _tiempoController.text,
              onSelectedResponse: (value) {
                setState(() {
                  _tiempoController.text = tiempoOpciones[value];
                });
              },
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.015),
          ],
        ),
      );
  }
}