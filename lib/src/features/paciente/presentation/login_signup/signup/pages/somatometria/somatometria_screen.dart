import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/decimal_picker_custom.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/number_picker_custom.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/dropdown_buttom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  String? _selectedFactor;

  @override
  void initState() {

    if(widget.map != null) {
      String peso = extractNumeric(widget.map?['Peso'] ?? '');
      widget.pesoController.text = peso;

      widget.tallaController.text = toCms(widget.map?['Talla'] ?? '');

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

  String toCms(String text){
    final regex = RegExp(r'(\d+(\.\d+)?)');
    final match = regex.firstMatch(text);

    if(match == null){
      return '0';
    }

    double mtrs = double.parse(match.group(0) ?? '0');
    int cms = mtrs.toInt();
    return cms.toString();
  }

  void _onPesoChanged(double value){
    setState(() {
      widget.pesoController.text = value.toString();
    });
  }

  void _onTallaChanged(int value){
    setState(() {
      widget.tallaController.text = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<PacienteBloc, PacienteState>(
      listener: (context, state) {
        if (state is PacienteUpdateSomatometriaSuccess) {
          CustomSnackbar.show(
              context: context,
              typeMessage: TypeMessage.success,
              title: MessagesSnackbar.updateSuccess,
              description: 'Los datos se actualizaron correctamente'
          );
          Navigator.pop(context);
        } else if(state is PacienteNonValidateUpdate){
          CustomSnackbar.show(
              context: context,
              typeMessage: TypeMessage.warning,
              title: 'Correo ya registrado',
              description: 'Por favor, usa un correo diferente.'
          );
        } else if (state is PacienteError) {
          CustomSnackbar.show(
            context: context,
            typeMessage: TypeMessage.error,
            title: MessagesSnackbar.error,
            description: MessagesSnackbar.messageConnectionError,
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            color: brightness == Brightness.light
                ? colorScheme.onPrimary.withOpacity(0.4)
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
                            : Colors.black38,
                        helpIcon: true,
                        onPressed: () {
                          CustomSnackbar.show(
                              context: context,
                              typeMessage: TypeMessage.info,
                              title: 'Factor de actividad',
                              description: 'Se refiere al nivel de actividad física que usted realiza'
                          );
                        },
                      ),
                      AppSizeBoxStyle.sizeBox(height: height, percentage: 0.04),
                      NumberPickerCustom(
                        labelText: 'Talla',
                        minValue: 0,
                        currentValue: int.parse(widget.tallaController.text),
                        maxValue: 200,
                        step: 1,
                        measure: 'cms',
                        onChanged: _onTallaChanged,
                        alignment: Alignment.center,
                        positionTop: -8,
                        positionBottom: 38,
                        heightContainer: 60,
                      ),
                      AppSizeBoxStyle.sizeBox(height: height, percentage: 0.04),
                      DecimalPickerCustom(
                        labelText: 'Peso',
                        minValue: 0,
                        currentValue: double.parse(widget.pesoController.text),
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
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

}