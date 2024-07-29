import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/gender_widget.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/number_picker_custom.dart';
import 'package:app_plataforma/src/shared/widgets/dropdown_buttom_title.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// <>
class DataSheetScreen extends StatefulWidget {

  final TextEditingController nacimientoController;
  final TextEditingController generoController;
  final TextEditingController numMiembrosController;
  final TextEditingController estadoCivilController;
  final TextEditingController estudiosController;
  final Map<String, String>? map;

  const DataSheetScreen({
    super.key,
    this.map,
    required this.nacimientoController,
    required this.generoController,
    required this.numMiembrosController,
    required this.estadoCivilController,
    required this.estudiosController
  });

  @override
  State<DataSheetScreen> createState() => _DataSheetScreenState();

}

class _DataSheetScreenState extends State<DataSheetScreen> with AutomaticKeepAliveClientMixin<DataSheetScreen> {

  final _dateController = TextEditingController();
  DateTime? _dateSelected = DateTime.now();
  String? _selectedEstadoCivil;
  String? _selectedEstudios;

  @override
  void initState() {

    if(widget.map != null){

      String fecha = widget.map?['Fecha de nacimiento'] ?? '';
      _dateSelected =  DateTime.parse(fecha);
      widget.nacimientoController.text = DateFormat('d \'de\' MMMM \'del\' yyyy', 'es').format(_dateSelected!);

      String numeroMiembros = widget.map?['Miembros del hogar'] ?? '0';
      widget.numMiembrosController.text = numeroMiembros;

      _selectedEstadoCivil = mapEstado[widget.map?['estadocivil'] ?? ''];
      widget.estadoCivilController.text = _selectedEstadoCivil.toString();

      _selectedEstudios = widget.map?['Nivel de estudios'];
      widget.estudiosController.text = _selectedEstudios.toString();

      widget.generoController.text = widget.map?['Género'] ?? '';

    }

    super.initState();
  }

  void onGenderChanged(String gender) {
    setState(() {
      widget.generoController.text = gender;
    });
  }

  void onNumMiembrosChanged(int num){
    setState(() {
      widget.numMiembrosController.text = num.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
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
        initialDateTime: _dateSelected ?? DateTime.now(),
        minDateTime: DateTime(1900),
        maxDateTime: DateTime(2500),
        onSubmit: (date) {
          setState(() {
            _dateSelected = date;
            widget.nacimientoController.text = DateFormat('yyyy-MM-dd').format(date);
            _dateController.text = DateFormat('d \'de\' MMMM \'del\' yyyy', 'es').format(date);
          });
        },
        height: height*0.35,
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
      child: Container(
        color: brightness == Brightness.light
            ? colorScheme.background.withOpacity(0.4)
            : Colors.black38,
        child: Column(
          children: [
            InfoSection(
              title: 'Datos personales',
              children: [
                GenderWidget(
                  labelText: 'Género',
                  onGenderChanged: onGenderChanged,
                  initialGender: widget.generoController.text == '' ? 'Masculino' : widget.generoController.text,
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.04),
                DropdownButtomTitle(
                    items: estadoOpciones,
                    labelTitle: 'Estado civil',
                    selectedValue: _selectedEstadoCivil,
                    onChanged:  (value) {
                      setState(() {
                        _selectedEstadoCivil = value;
                        widget.estadoCivilController.text = value.toString();
                      });
                    },
                    label: 'Seleccione su estado civil',
                    heightList: height * 0.5,
                    heightButton: height * 0.08,
                    width: height*0.40,
                    backgroundColor: brightness == Brightness.light
                        ? Colors.white
                        : Colors.black38
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.04),
                DropdownButtomTitle(
                  labelTitle: 'Nivel de estudios',
                  items: estudiosOpciones,
                  selectedValue: _selectedEstudios,
                  onChanged:  (value) {
                    setState(() {
                      _selectedEstudios = value;
                      widget.estudiosController.text = value.toString();
                    });
                  },
                    label: 'Seleccione sus estudios',
                    heightList: height * 0.5,
                    heightButton: height * 0.08,
                    width: height*0.40,
                    backgroundColor: brightness == Brightness.light
                        ? Colors.white
                        : Colors.black38
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.04),
                FastTextFieldTitleCustom(
                  suffixIcon: Icons.calendar_today_rounded,
                  readOnly: true,
                  controller: _dateController,
                  labelText: 'Fecha de nacimiento',
                  onTap: selectedDate,
                  hintText:  widget.nacimientoController.text == ''
                      ? DateFormat('d \'de\' MMMM \'del\' yyyy', 'es').format(DateTime.now())
                      : _dateController.text,
                  hintOpacity: 1,
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.04),
                NumberPickerCustom(
                  labelText: 'Miembros del hogar',
                  minValue: 0,
                  currentValue: int.parse(widget.numMiembrosController.text),
                  maxValue: 50,
                  step: 1,
                  onChanged: onNumMiembrosChanged,
                  heightContainer: height * 0.065,
                  positionTop: -8,
                ),
                AppSizeBoxStyle.sizeBox(height: height),

              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}
