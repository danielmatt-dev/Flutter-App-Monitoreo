import 'package:app_plataforma/src/core/styles/app_button_styles.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/valor_glucosa/presentation/bloc/valor_glucosa_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MeasurementEntryScreen extends StatefulWidget {
  final bool isGlucose;

  const MeasurementEntryScreen({
    super.key,
    required this.isGlucose
  });

  @override
  State<MeasurementEntryScreen> createState() => _MeasurementEntryScreenState();
}

class _MeasurementEntryScreenState extends State<MeasurementEntryScreen> {

  late ValorGlucosaBloc valorGlucosaBloc;
  late String formattedDate;
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _notasController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    formattedDate = DateFormat('d MMMM yyyy', 'es').format(now);
  }

  void _onSave(BuildContext context) {
    final int valor = int.tryParse(_valorController.text) ?? 0;
    final String medicion = widget.isGlucose ? 'Glucosa' : 'Presión';
    final String notas = _notasController.text;

    valorGlucosaBloc = sl<ValorGlucosaBloc>()..add(CaptureValorGlucosa(
      valor: valor,
      medicion: medicion,
      notas: notas,
    ));

  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider<ValorGlucosaBloc>(
      create: (context) => sl<ValorGlucosaBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: AppTextStyles.autoBodyStyle(
              text: widget.isGlucose
                  ? 'Glucosa'
                  : 'Presión',
              color: colorScheme.onBackground,
              height: height,
              percent: 0.03
          ),
          centerTitle: true,
          leading: IconButton(
            icon: AppButtonStyles.iconStyle(iconData: Icons.close, height: height, color: Colors.red),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: AppButtonStyles.iconStyle(iconData: Icons.check, height: height, color: Colors.green),
              onPressed: () => _onSave(context),
            ),
          ],
        ),
      
      body: BlocBuilder<ValorGlucosaBloc, ValorGlucosaState>(
      builder: (context, state) {
        if (state is ValorGlucosaLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ValorGlucosaSaveSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Guardado con éxito')),
            );
            if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
            }
          });
        } else if (state is ValorGlucosaError) {

        }
      
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextStyles.autoBodyStyle(text: 'Fecha: ', color: colorScheme.onBackground, height: height),
                    AppTextStyles.autoBodyStyle(text: formattedDate, color: colorScheme.onBackground, height: height),
                  ],
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextStyles.autoBodyStyle(text: 'Hora: ', color: colorScheme.onBackground, height: height),
                    AppTextStyles.autoBodyStyle(
                      text: DateFormat('h:mm a').format(DateTime.now()),
                      color: colorScheme.onBackground,
                      height: height,
                    ),
                  ],
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                if (!widget.isGlucose) ...[
                  _buildTextFieldRow('Sistólica: ', colorScheme, height, 'mm Hg', _valorController),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                  _buildTextFieldRow('Diastólica: ', colorScheme, height, 'mm Hg', _valorController),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                ],
                if (widget.isGlucose) ...[
                  _buildTextFieldRow('Glucosa: ', colorScheme, height, 'mg/dL', _valorController),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                ],
                AppTextStyles.autoBodyStyle(text: 'Notas: ', color: colorScheme.onBackground, height: height),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                TextField(
                  controller: _notasController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Ingrese sus notas aquí...',
                  ),
                ),
                SizedBox(height: height * 0.02),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _onSave(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
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
            ),
          ),
        );
      },
      ),
      ),
    );
  }

  Widget _buildTextFieldRow(String label, ColorScheme colorScheme, double height, String medida, TextEditingController controller) {
    return Row(
      children: [
        AppTextStyles.autoBodyStyle(text: label, color: colorScheme.onBackground, height: height),
        SizedBox(
          width: 80,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: colorScheme.onBackground),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: colorScheme.primary),
              ),
            ),
          ),
        ),
        AppTextStyles.autoBodyStyle(text: medida, color: colorScheme.onBackground, height: height),
      ],
    );
  }

}
