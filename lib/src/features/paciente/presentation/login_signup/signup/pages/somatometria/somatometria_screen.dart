import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/decimal_picker_custom.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/number_picker_custom.dart';
import 'package:app_plataforma/src/shared/widgets/dropdown_buttom_title.dart';
import 'package:flutter/material.dart';

// <>
class SomatometriaScreen extends StatefulWidget {

  final Map<String, String>? map;

  final TextEditingController pesoController;
  final TextEditingController tallaController;
  final TextEditingController factorController;

  const SomatometriaScreen({
    super.key,
    this.map,
    required this.pesoController,
    required this.tallaController,
    required this.factorController
  });

  @override
  State<SomatometriaScreen> createState() => _SomatometriaScreenState();

}

class _SomatometriaScreenState extends State<SomatometriaScreen> with AutomaticKeepAliveClientMixin<SomatometriaScreen> {

  double _currentPesoValue = 50.0;
  int _currentTallaValue = 150;
  String? _selectedFactor;

  @override
  void initState() {

    if(widget.map != null) {
      String peso = extractNumeric(widget.map?['Peso'] ?? '');
      _currentPesoValue = double.parse(peso);
      widget.pesoController.text = _currentPesoValue.toString();

      _currentTallaValue = toCms(widget.map?['Talla'] ?? '');
      widget.tallaController.text = _currentTallaValue.toString();

      _selectedFactor = widget.map?['Factor de actividad'];
      widget.factorController.text = _selectedFactor ?? '';

    }

    super.initState();
  }

  String extractNumeric(String text) {
    final regex = RegExp(r'(\d+(\.\d+)?)');
    final match = regex.firstMatch(text);

    return match?.group(0) ?? '0';
  }

  int toCms(String text){
    final regex = RegExp(r'(\d+(\.\d+)?)');
    final match = regex.firstMatch(text);

    if(match == null){
      return _currentTallaValue;
    }

    double mtrs = double.parse(match.group(0) ?? '0');
    return (mtrs * 100).toInt();
  }

  void _onPesoChanged(double value){
    setState(() {
      _currentPesoValue = value;
      widget.pesoController.text = value.toString();
    });
  }

  void _onTallaChanged(int value){
    setState(() {
      _currentTallaValue = value;
      widget.tallaController.text = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        color: brightness == Brightness.light
            ? colorScheme.background.withOpacity(0.4)
            : Colors.black38,
        child: Column(
          children: [
            InfoSection(
                title: 'Somatometría',
                children: [
                  DropdownButtomTitle(
                      labelTitle: 'Factor de actividad',
                      items: factorOpciones,
                      selectedValue: _selectedFactor,
                      onChanged:  (value) {
                        setState(() {
                          _selectedFactor = value;
                          widget.factorController.text = _selectedFactor ?? '';
                        });
                      },
                      label: 'Seleccione su factor',
                      heightList: height * 0.5,
                      heightButton: height * 0.08,
                      width: height*0.40,
                      backgroundColor: brightness == Brightness.light
                          ? Colors.white
                          : Colors.black38
                  ),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.04),
                  NumberPickerCustom(
                    labelText: 'Talla',
                    minValue: 0,
                    currentValue: _currentTallaValue,
                    maxValue: 200,
                    step: 1,
                    measure: 'cms',
                    onChanged: _onTallaChanged,
                    alignment: Alignment.center,
                    positionTop: -8,
                    positionBottom: 40,
                    heightContainer: height * 0.085,
                  ),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.04),
                  DecimalPickerCustom(
                    labelText: 'Peso',
                    minValue: 0,
                    currentValue: _currentPesoValue,
                    maxValue: 200,
                    step: 2,
                    measure: 'kgs',
                    onChanged: _onPesoChanged,
                  ),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.04),
                ]
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}