import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataSheetScreen extends StatefulWidget {
  const DataSheetScreen({super.key});

  @override
  State<DataSheetScreen> createState() => _DataSheetScreenState();
}

class _DataSheetScreenState extends State<DataSheetScreen> {

  final TextEditingController _nacimientoController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _numMiembrosController = TextEditingController();
  final TextEditingController _estadoCivilController = TextEditingController();
  final TextEditingController _estudiosController = TextEditingController();

  DateTime? dateSelected;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nacimientoController.dispose();
    _generoController.dispose();
    _numMiembrosController.dispose();
    _estadoCivilController.dispose();
    _estudiosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    Future<void> selectedDate() async {
      dateSelected = await showDatePicker(
          context: context,
          locale: const Locale('es', 'ES'),
          initialDate: dateSelected,
          firstDate: DateTime(1900),
          lastDate: DateTime(2500)
      );

      if(dateSelected != null) {
        setState(() {
          print(dateSelected);
          _nacimientoController.text =  DateFormat('d \'de\' MMMM \'del\' yyyy', 'es').format(dateSelected!);
          print(_nacimientoController.text);
        });
      }

    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          InfoSection(
            title: 'Datos personales',
            children: [
              FastTextFieldCustom(
                suffixIcon: Icons.calendar_today_rounded,
                readOnly: true,
                controller: _nacimientoController,
                labelText: 'Fecha de nacimiento',
                onTap: selectedDate,
                hintText: _nacimientoController.text
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.05),
            ],
          ),
        ],
      ),
    );
  }
}