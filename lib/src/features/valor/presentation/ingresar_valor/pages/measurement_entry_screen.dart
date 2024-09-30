import 'package:app_plataforma/src/core/styles/app_button_styles.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/bloc/valor_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/dropdown_button_custom.dart';
import 'package:app_plataforma/src/shared/widgets/image_upload_widget.dart';
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

      if(_glucosaController.text.isEmpty){
        _showSnackBar(message: 'El valor de glucosa no debe estar vacío');
        return false;
      }

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
          size: SizeIcon.size18,
      ),
      cancelBtnTextStyle: AppTextStyles.bodyStyle(
          color: colorScheme.primary,
          size: SizeIcon.size18
      ),
      onConfirmBtnTap: () {

        // Cierra el diálogo explícitamente
        Navigator.of(context, rootNavigator: true).pop();

        // Lógica para guardar la medición
        /*
      widget.isGlucose
          ? valorBloc.add(SubmitGlucosaForm(selectedValue!, _notasController.text))
          : valorBloc.add(SubmitPresionForm(selectedValue!, _notasController.text));
      */

        // Mostrar el snackbar
        CustomSnackbar.show(
            context: context,
            typeMessage: TypeMessage.success,
            title: MessagesSnackbar.success,
            description: MessagesSnackbar.messageSaveSuccess
        );

        // Cerrar la pantalla si lo necesitas después de guardar
        Navigator.of(context).pop();
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
              text: widget.isGlucose ? 'Glucosa' : 'Presión Arterial',
              color: colorScheme.primary,
              size: SizeIcon.size22,
            ),
          centerTitle: true,
          leading: IconButton(
            icon: AppButtonStyles.iconStyle(
                iconData: Icons.close,
                color: mapColor['Rojo'],
                size: SizeIcon.size30
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: AppButtonStyles.iconStyle(
                  iconData: Icons.check,
                  color: mapColor['Verde'],
                  size: SizeIcon.size30
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                BlocConsumer<ValorBloc, ValorState>(
                  listener: (context, state) {
                    if (state is ValorSaveSuccess) {
                      CustomSnackbar.show(
                          context: context,
                          typeMessage: TypeMessage.success,
                          title: MessagesSnackbar.success,
                          description: MessagesSnackbar.messageSaveSuccess
                      );
                      Navigator.pop(context);
                    } else if (state is GlucosaFormState && state.status.isSubmissionFailure) {
                      CustomSnackbar.show(
                        context:  context,
                        typeMessage: TypeMessage.error,
                        title: MessagesSnackbar.error,
                        description: MessagesSnackbar.messageConnectionError,
                      );
                    } else if (state is PresionFormState && state.status.isSubmissionFailure) {
                      CustomSnackbar.show(
                        context:  context,
                        typeMessage: TypeMessage.error,
                        title: MessagesSnackbar.error,
                        description: MessagesSnackbar.messageConnectionError,
                      );
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppTextStyles.autoBodyStyle(
                              text: 'Fecha',
                              color: colorScheme.primary,
                              size: SizeIcon.size16,
                            ),
                            AppTextStyles.autoBodyStyle(
                              text: formattedDate,
                              color: colorScheme.primary,
                              size: SizeIcon.size16,
                            ),
                          ],
                        ),
                        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppTextStyles.autoBodyStyle(
                              text: 'Hora',
                              color: colorScheme.primary,
                              size: SizeIcon.size16,
                            ),
                            AppTextStyles.autoBodyStyle(
                              text: DateFormat('h:mm a').format(DateTime.now()),
                              color: colorScheme.primary,
                              size: SizeIcon.size16,
                            ),
                          ],
                        ),
                        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                        if (!widget.isGlucose) ...[
                          _buildTextFieldRow(
                            'Sistólica',
                            '123',
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
                            '123',
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
                            '123',
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
                                      title: MessagesSnackbar.warning,
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
                            borderColor: colorScheme.onPrimary,
                            borderSelectedColor: colorScheme.onPrimary,
                            backgroundColor: colorScheme.onPrimary,
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
                        if(widget.isGlucose)
                          Column(
                            children: [
                              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                              const Row(
                                children: [
                                  ImageUploadWidget(title: 'Pie Izquierdo'),
                                  SizedBox(width: 20,),
                                  ImageUploadWidget(title: 'Pie Derecho'),
                                ],
                              ),
                              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                              const Row(
                                children: [
                                  ImageUploadWidget(title: 'Ojo Izquierdo'),
                                  SizedBox(width: 20,),
                                  ImageUploadWidget(title: 'Ojo Derecho'),
                                ],
                              )
                            ],
                          ),
                        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppTextStyles.autoBodyStyle(
                            text: 'Notas',
                            color: colorScheme.primary,
                            size: SizeIcon.size16,
                          )
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
                              size: SizeIcon.size16,
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
                              color: colorScheme.onPrimary
                            ),
                          ),
                        ),
                      ],
                    );
                    },
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget _buildTextFieldRow(
      String label,
      String hintText,
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
              size: SizeIcon.size16,
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
              size: SizeIcon.size16,
            ),
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.bodyStyle(
                color: isInvalid ? colorScheme.error : colorScheme.primary.withOpacity(0.2),
                size: SizeIcon.size16,
              ),
              errorStyle: AppTextStyles.bodyStyle(
                  color: colorScheme.error,
                  size: SizeIcon.size12,
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
            size: SizeIcon.size16,
          ),
        ),
      ],
    );
  }
}