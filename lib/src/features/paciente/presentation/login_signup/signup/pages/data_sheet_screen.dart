import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/gender_widget.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/number_picker_custom.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_custom.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

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

  DateTime? dateSelected = DateTime.now();

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

  void onGenderChanged(String gender) {
    setState(() {
      _generoController.text = gender;
    });
  }

  void onNumMiembrosChanged(int num){
    _numMiembrosController.text = num.toString();
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    Future<void> selectedDate() async {
      BottomPicker.date(
        pickerTitle: AppTextStyles.autoBodyStyle(
            text: 'Selecciona una fecha',
            color: colorScheme.onBackground,
            height: height
        ),
        displayCloseIcon: false,
        buttonWidth: height*0.15,
        initialDateTime: dateSelected ?? DateTime.now(),
        minDateTime: DateTime(1900),
        maxDateTime: DateTime(2500),
        onSubmit: (date) {
          setState(() {
            dateSelected = date;
            _nacimientoController.text = DateFormat('d \'de\' MMMM \'del\' yyyy', 'es').format(date);
          });
        },
        backgroundColor: colorScheme.background,
        dateOrder:  DatePickerDateOrder.dmy,
        pickerTextStyle: AppTextStyles.buttonStyle(
            color: colorScheme.onBackground,
            size: height*0.022
        ),
        buttonStyle: BoxDecoration(
          color: colorScheme.onBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        buttonPadding: 5,
        buttonContent: AppTextStyles.autoBodyStyle(
            text: 'Guardar',
            color: colorScheme.background,
            height: height,
            percent: 0.022,
            textAlign: TextAlign.center
        ),
        dismissable: true,
      ).show(context);
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
                hintText:  _nacimientoController.text == ''
                    ? DateFormat('d \'de\' MMMM \'del\' yyyy', 'es').format(DateTime.now())
                    : _nacimientoController.text,
                hintOpacity: 1,
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.025),
              GenderWidget(labelText: 'Género', onGenderChanged: onGenderChanged,),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.025),
              NumberPickerCustom(
                    labelText: 'Miembros del hogar',
                    onChanged: onNumMiembrosChanged
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.025),

            ],
          ),
        ],
      ),
    );
  }
}
