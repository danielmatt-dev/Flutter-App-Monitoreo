import 'package:app_plataforma/src/core/styles/app_button_styles.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/bloc/valor_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/dropdown_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MeasurementEntryScreen extends StatefulWidget {

  final List<String> measurements;
  final bool isGlucose;

  const MeasurementEntryScreen({
    super.key,
    required this.isGlucose,
    required this.measurements
  });

  @override
  State<MeasurementEntryScreen> createState() => _MeasurementEntryScreenState();
}

class _MeasurementEntryScreenState extends State<MeasurementEntryScreen> {

  late ValorBloc valorBloc = sl<ValorBloc>();

  late String formattedDate;
  final _glucosaController = TextEditingController();
  final _sistolicaController = TextEditingController();
  final _diastolicaController = TextEditingController();
  final _notasController = TextEditingController();

  String? selectedValue;
  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    valorBloc.add(InitializeForm(widget.isGlucose));
    final now = DateTime.now();
    formattedDate = DateFormat('d MMMM yyyy', 'es').format(now);
  }

  void _showConfirmationDialog(BuildContext context, ColorScheme colorScheme, double height) {
    if(selectedValue == null){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor selecciona una medición')));
      return;
    }
    if(!isFormValid){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor ingresa los valores')));
      return;
    }
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: '¿Deseas guardar la medición?',
      titleColor: colorScheme.onBackground,
      textColor: colorScheme.onBackground,
      confirmBtnText: 'Si',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.green,
      confirmBtnTextStyle: AppTextStyles.bodyStyle(
          color: colorScheme.background,
          size: height * 0.025
      ),
      cancelBtnTextStyle: AppTextStyles.bodyStyle(
          color: colorScheme.onBackground,
          size: height * 0.025
      ),
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        widget.isGlucose
            ? valorBloc.add(SubmitGlucosaForm(selectedValue!, _notasController.text))
            : valorBloc.add(SubmitPresionForm(selectedValue!, _notasController.text));
      },
      onCancelBtnTap: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        title: AppTextStyles.autoBodyStyle(
            text: widget.isGlucose
                ? 'Glucosa'
                : 'Presión Arterial',
            color: colorScheme.onBackground,
            height: height,
            percent: 0.03
        ),
        centerTitle: true,
        leading: IconButton(
          icon: AppButtonStyles.iconStyle(
              iconData: Icons.close,
              height: height,
              color: mapColor['Rojo']
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: AppButtonStyles.iconStyle(
                iconData: Icons.check,
                height: height,
                color: mapColor['Verde']
            ),
            onPressed: () {
              if(selectedValue == null){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor selecciona una medición')));
                return;
              }
              if(!isFormValid){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor ingresa los valores')));
                return;
              }
              return _showConfirmationDialog(context, colorScheme, height);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocConsumer<ValorBloc, ValorState>(
                    listener: (context, state) {
                      if (state is ValorSaveSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Datos guardados exitosamente')));
                      } else if (state is GlucosaFormState && state.status.isSubmissionFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error al guardar datos de glucosa')));
                      } else if (state is PresionFormState && state.status.isSubmissionFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error al guardar datos de presión')));
                      }
                    },
                    builder: (context, state) {
                      bool isGlucoseInvalid = false;
                      bool isSistolicaInvalid = false;
                      bool isDiastolicaInvalid = false;

                      if (state is PresionFormState) {
                        isSistolicaInvalid = !state.valorSistolica.valid && state.showErrorMessages;
                        isDiastolicaInvalid = !state.valorDiastolica.valid && state.showErrorMessages;
                        isFormValid = state.status.isValidated;
                      } else if (state is GlucosaFormState) {
                        isGlucoseInvalid = !state.valorGlucosa.valid && state.showErrorMessages;
                        isFormValid = state.status.isValidated;
                      }

                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CustomDropdownButton(
                              items: widget.measurements,
                              selectedValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                          ),
                          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppTextStyles.autoBodyStyle(
                                  text: 'Fecha',
                                  color: colorScheme.onBackground,
                                  height: height,
                                  percent: 0.022
                              ),
                              AppTextStyles.autoBodyStyle(
                                  text: formattedDate,
                                  color: colorScheme.onBackground,
                                  height: height,
                                  percent: 0.022
                              ),
                            ],
                          ),
                          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppTextStyles.autoBodyStyle(
                                  text: 'Hora',
                                  color: colorScheme.onBackground,
                                  height: height,
                                  percent: 0.022
                              ),
                              //const Expanded(flex: 1, child: SizedBox()),
                              AppTextStyles.autoBodyStyle(
                                  text: DateFormat('h:mm a').format(DateTime.now()),
                                  color: colorScheme.onBackground,
                                  height: height,
                                  percent: 0.022
                              ),
                            ],
                          ),
                          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                          if (!widget.isGlucose) ...[
                            _buildTextFieldRow(
                              'Sistólica',
                              colorScheme,
                              height,
                              'mm Hg',
                              _sistolicaController,
                              isSistolicaInvalid,
                                    (value) => valorBloc.add(SistolicaChanged(value)),
                              1
                            ),
                            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                            _buildTextFieldRow(
                              'Diastólica',
                              colorScheme,
                              height,
                              'mm Hg',
                              _diastolicaController,
                              isDiastolicaInvalid,
                                  (value) => valorBloc.add(DiastolicaChanged(value)),
                              2
                            ),
                            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                          ],
                          if (widget.isGlucose) ...[
                            _buildTextFieldRow(
                              'Glucosa',
                              colorScheme,
                              height,
                              'mg/dL',
                              _glucosaController,
                              isGlucoseInvalid,
                                  (value) => valorBloc.add(GlucosaChanged(value)),
                              0
                            ),
                            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                          ],
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AppTextStyles.autoBodyStyle(
                                text: 'Notas',
                                color: colorScheme.onBackground,
                                height: height,
                                percent: 0.022
                            ),
                          ),
                          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                          TextField(
                            controller: _notasController,
                            maxLines: 5,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(120),
                            ],
                            style: AppTextStyles.bodyStyle(
                                color: colorScheme.onBackground,
                                size: height * 0.022
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Ingrese sus notas aquí...',
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                if(selectedValue == null){
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor selecciona una medición')));
                                  return;
                                }
                                if(!isFormValid){
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor ingresa los valores')));
                                  return;
                                }
                                return _showConfirmationDialog(context, colorScheme, height);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: mapColor['Verde'],
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: AppTextStyles.autoBodyStyle(
                                text: 'GUARDAR',
                                color: colorScheme.background,
                                height: height,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          )
    );
  }

  String _errorMessages(int medicion){
    final messages = ['60-130', '110-190', '70-120'];

    return messages[medicion];
  }

  Widget _buildTextFieldRow(
      String label,
      ColorScheme colorScheme,
      double height,
      String medida,
      TextEditingController controller,
      bool isInvalid,
      ValueChanged<String>? onChanged,
      int posicion
      ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.centerRight,
            child: AppTextStyles.autoBodyStyle(
              text: label,
              color: colorScheme.onBackground,
              height: height,
              percent: 0.022,
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        Expanded(
          flex: 2,
          child: TextField(
            onChanged: onChanged,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],
            style: AppTextStyles.bodyStyle(
              color: colorScheme.onBackground,
              size: height * 0.022,
            ),
            controller: controller,
            decoration: InputDecoration(
              errorText: isInvalid ? _errorMessages(posicion) : null,
              errorStyle: AppTextStyles.bodyStyle(
                  color: colorScheme.error,
                  size: height * 0.015,
              ).copyWith(),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: colorScheme.onBackground),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: colorScheme.primary),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: AppTextStyles.autoBodyStyle(
            text: medida,
            color: colorScheme.onBackground,
            height: height,
            percent: 0.022,
          ),
        ),
      ],
    );
  }
}