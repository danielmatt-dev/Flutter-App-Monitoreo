import 'package:app_plataforma/src/core/styles/app_button_styles.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/bloc/valor_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/dropdown_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

  void _showSnackBar({String title = 'Alerta', required String message}) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      CustomSnackbar.show(
          context: context,
          typeMessage: TypeMessage.warning,
          title: title,
          description: message
      );
    });
  }

  bool _validateForm(){

    if(selectedValue == null){
      _showSnackBar(message: 'Por favor, selecciona una medición');
      return false;
    }

    if (widget.isGlucose) {
      int glucosaValue = int.tryParse(_glucosaController.text) ?? 0;

      int minGlucosa = 0;
      int maxGlucosa = 700;

      if(selectedValue == '2 horas después de la comida'){
        minGlucosa = 100;
      }

      if(glucosaValue < minGlucosa){
        _showSnackBar(message: 'El valor de glucosa debe ser mayor o igual a $minGlucosa mg/dL.');
        return false;
      }

      if (glucosaValue > maxGlucosa) {
        _showSnackBar(message: 'El valor de glucosa debe ser menor o igual a $maxGlucosa mg/dL.');
        return false;
      }

    }

    if (!widget.isGlucose) {

      int sistolicaValue = int.tryParse(_sistolicaController.text) ?? 0;
      int diastolicaValue = int.tryParse(_diastolicaController.text) ?? 0;

      int minPresion = 50;
      int maxPresion = 300;

      if (sistolicaValue < minPresion) {
        _showSnackBar(message: 'El valor de presión sistólica debe ser mayor o igual a $minPresion mm Hg.');
        return false;
      }

      if (sistolicaValue > maxPresion) {
        _showSnackBar(message: 'El valor de presión sistólica debe ser menor o igual a $maxPresion mm Hg.');
        return false;
      }

      if (diastolicaValue < minPresion) {
        _showSnackBar(message: 'El valor de presión diastólica debe ser mayor o igual a $minPresion mm Hg.');
        return false;
      }

      if (diastolicaValue > maxPresion) {
        _showSnackBar(message: 'El valor de presión diastólica debe ser menor o igual a $maxPresion mm Hg.');
        return false;
      }

    }

    return true;
  }

  void _showConfirmationDialog(BuildContext context, ColorScheme colorScheme, double height) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: '¿Deseas guardar la medición?',
      titleColor: colorScheme.primary,
      textColor: colorScheme.primary,
      confirmBtnText: 'Si',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.green,
      confirmBtnTextStyle: AppTextStyles.bodyStyle(
          color: colorScheme.onPrimary,
          size: height * 0.025
      ),
      cancelBtnTextStyle: AppTextStyles.bodyStyle(
          color: colorScheme.primary,
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
    final width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          appBar: AppBar(
            backgroundColor: colorScheme.surface,
            elevation: 0,
            title: AppTextStyles.autoBodyStyle(
                text: widget.isGlucose
                    ? 'Glucosa'
                    : 'Presión Arterial',
                color: colorScheme.primary,
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
                if(_validateForm()) {
                  return _showConfirmationDialog(context, colorScheme, height);
                }
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
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            CustomSnackbar.show(
                                context: context,
                                typeMessage: TypeMessage.success,
                                title: 'Registro exitoso',
                                description: 'Valor guardado correctamente'
                            );
                          });
                          Navigator.pop(context);
                        } else if (state is GlucosaFormState && state.status.isSubmissionFailure) {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            CustomSnackbar.show(
                              context:  context,
                              typeMessage: TypeMessage.error,
                              title: 'Error',
                              description: 'Vuelva a intentarlo más tarde',
                            );
                          });
                        } else if (state is PresionFormState && state.status.isSubmissionFailure) {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            CustomSnackbar.show(
                              context:  context,
                              typeMessage: TypeMessage.error,
                              title: 'Error',
                              description: 'Vuelva a intentarlo más tarde',
                            );
                          });
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AppTextStyles.autoBodyStyle(
                                    text: 'Fecha',
                                    color: colorScheme.primary,
                                    height: height,
                                    percent: 0.022
                                ),
                                AppTextStyles.autoBodyStyle(
                                    text: formattedDate,
                                    color: colorScheme.primary,
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
                                    color: colorScheme.primary,
                                    height: height,
                                    percent: 0.022
                                ),
                                //const Expanded(flex: 1, child: SizedBox()),
                                AppTextStyles.autoBodyStyle(
                                    text: DateFormat('h:mm a').format(DateTime.now()),
                                    color: colorScheme.primary,
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
                                      (value) {
                                  /*
                                  if(selectedValue == null) {
                                    CustomSnackbar.show(
                                        context: context,
                                        typeMessage: TypeMessage.warning,
                                        title: 'Alerta',
                                        description: 'Por favor, seleccione su medición'
                                    );
                                    return;
                                  }
                                  valorBloc.add(GlucosaChanged(value, selectedValue!));
                                  */
                                  },
                              ),
                              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                            ],
                            Align(
                              alignment: Alignment.center,
                              child: CustomDropdownButton(
                                width: width*0.75,
                                heightList: height*0.5,
                                heightButton: height*0.08,
                                borderColor: colorScheme.onPrimary,
                                borderSelectedColor: colorScheme.onPrimary,
                                textPercent: 0.022,
                                heightPercent: 0.05,
                                items: widget.measurements,
                                label: 'Seleccione su medición',
                                selectedValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                              ),
                            ),
                            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppTextStyles.autoBodyStyle(
                                  text: 'Notas',
                                  color: colorScheme.primary,
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
                                  color: colorScheme.primary,
                                  size: height * 0.022
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: 'Ingrese sus notas aquí...',
                                hintStyle: TextStyle(
                                  color: colorScheme.primary.withOpacity(0.4)
                                )
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  if(_validateForm()) {
                                    return _showConfirmationDialog(context, colorScheme, height);
                                  }
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
                                  color: colorScheme.onPrimary,
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
      ),
    );
  }

  Widget _buildTextFieldRow(
      String label,
      ColorScheme colorScheme,
      double height,
      String medida,
      TextEditingController controller,
      bool isInvalid,
      ValueChanged<String>? onChanged
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
              color: colorScheme.primary,
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
              LengthLimitingTextInputFormatter(3)
            ],
            style: AppTextStyles.bodyStyle(
              color: colorScheme.primary,
              size: height * 0.022,
            ),
            controller: controller,
            decoration: InputDecoration(
              errorStyle: AppTextStyles.bodyStyle(
                  color: colorScheme.error,
                  size: height * 0.015,
              ).copyWith(),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: colorScheme.primary),
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
            color: colorScheme.primary,
            height: height,
            percent: 0.022,
          ),
        ),
      ],
    );
  }
}