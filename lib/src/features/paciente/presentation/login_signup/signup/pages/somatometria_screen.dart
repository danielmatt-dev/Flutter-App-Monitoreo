import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/decimal_picker_custom.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/number_picker_custom.dart';
import 'package:app_plataforma/src/shared/widgets/dropdown_buttom_title.dart';
import 'package:flutter/material.dart';

// <>
class SomatometriaScreen extends  StatefulWidget {

  const SomatometriaScreen({super.key});

  @override
  State<SomatometriaScreen> createState() => _SomatometriaScreenState();

}

class _SomatometriaScreenState extends State<SomatometriaScreen> {

  double _currentPesoValue = 50.0;
  int _currentTallValue = 150;
  String? _selectedFactor;

  void _onPesoChanged(double value){
    setState(() {
      _currentPesoValue = value;
    });
  }

  void _onTallaChanged(int value){
    setState(() {
      _currentTallValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {

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
                    currentValue: _currentTallValue,
                    maxValue: 300,
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
                    maxValue: 700,
                    step: 2,
                    measure: 'kgs',
                    onChanged: _onPesoChanged,
                  ),
                ]
            )
          ],
        ),
      ),
    );
  }

}