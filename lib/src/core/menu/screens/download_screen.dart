import 'dart:async';
import 'package:app_plataforma/src/features/valor/presentation/reporte/cubit/reporte_cubit.dart';
import 'package:app_plataforma/src/features/valor/presentation/reporte/widgets/select_measurement.dart';
import 'package:app_plataforma/src/features/valor/presentation/reporte/widgets/select_period.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/icon_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadScreen extends StatefulWidget {

  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> with AutomaticKeepAliveClientMixin<DownloadScreen> {

  final reporteCubit = sl<ReporteCubit>();
  bool _isButtonDisabled = false;
  Timer? disableTimer;

  bool isSnackBarSuccessShow = false;
  bool isSnackBarErrorShow = false;

  String measurement = 'glucosa';
  int range = 4;

  Future<bool> requestPermission() async {

    bool isManagePermitted = true;

    var manageStatus = await Permission.manageExternalStorage.status;

    if(!manageStatus.isGranted){
      var result = await Permission.manageExternalStorage.request();
      isManagePermitted = result == PermissionStatus.granted;
    }

    return isManagePermitted;
  }

  @override
  Widget build(BuildContext context) {

    onPressed() async {

      if(_isButtonDisabled){
        return;
      }

      bool isPermissionGranted = await requestPermission();

      if(!isPermissionGranted && context.mounted){
        CustomSnackbar.show(
            context: context,
            typeMessage: TypeMessage.warning,
            title: MessagesSnackbar.requiredPermission,
            description: MessagesSnackbar.messagePermission
        );
        return;
      }

      reporteCubit.generarPdf(rango: range, medicion: measurement);

      setState(() {
        _isButtonDisabled = true;
      });

      //_disableTimer?.cancel();
      disableTimer = Timer(const Duration(seconds: 5), (){
        setState(() {
          _isButtonDisabled = false;
        });
      });
    }

    super.build(context);

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      child: BlocListener<ReporteCubit, ReporteState>(
        listener: (context, state) {
          if(state is PdfGlucosaSuccess || state is PdfPresionSuccess) {
            CustomSnackbar.show(
                context: context,
                typeMessage: TypeMessage.success,
                title: MessagesSnackbar.success,
                description: MessagesSnackbar.messagePdfSuccess
            );
          }

          if(state is PdfError) {

            CustomSnackbar.show(
                context: context,
                typeMessage: TypeMessage.error,
                title: MessagesSnackbar.errorPdf,
                description: MessagesSnackbar.messageConnectionError
            );

          }

        },
        child: Column(
            children: [
              SelectMeasurement(
                onMeasurementChanged: (value) {
                  setState(() {
                    measurement = value;
                  });
                  },
                containerColor: isDarkMode ? colorScheme.surface : colorScheme.primary,
                titleColor: isDarkMode ? colorScheme.primary : colorScheme.onPrimary,
              ),
              const SizedBox(height: 20,),
              SelectPeriod(
                onPeriodChanged: (value) {
                  setState(() {
                    range = value;
                  });
                },
                containerColor: isDarkMode ? colorScheme.surface : colorScheme.primary,
                titleColor: isDarkMode ? colorScheme.primary : colorScheme.onPrimary,
              ),
              const SizedBox(height: 10),
              IconButtonCustom(
                onPressed: onPressed,
                text: 'Descargar',
                color: isDarkMode ? colorScheme.surface : colorScheme.primary,
                icon: Icons.download,
              )
            ],
          ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}



