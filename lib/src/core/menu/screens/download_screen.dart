import 'dart:async';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/valor/presentation/reporte/cubit/reporte_cubit.dart';
import 'package:app_plataforma/src/features/valor/presentation/reporte/widgets/select_measurement.dart';
import 'package:app_plataforma/src/features/valor/presentation/reporte/widgets/select_period.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/icon_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadScreen extends StatefulWidget {

  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> with AutomaticKeepAliveClientMixin<DownloadScreen> {

  bool _isButtonDisabled = false;
  Timer? _disableTimer;

  String measurement = 'glucosa';
  int range = 4;

  @override
  Widget build(BuildContext context) {

    super.build(context);

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
        padding: const EdgeInsets.all(10),
      child: BlocProvider<ReporteCubit>(
        create: (context) => sl<ReporteCubit>(),
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
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.025),
              SelectPeriod(
                onPeriodChanged: (value) {
                  setState(() {
                    range = value;
                  });
                },
                containerColor: isDarkMode ? colorScheme.surface : colorScheme.primary,
                titleColor: isDarkMode ? colorScheme.primary : colorScheme.onPrimary,
              ),
              const Spacer(),
              IconButtonCustom(
                onPressed: !_isButtonDisabled ? () {

                    sl<ReporteCubit>().generarPdf(
                        rango: range,
                        medicion: measurement
                    );

                  setState(() {
                    _isButtonDisabled = true;
                  });

                  //_disableTimer?.cancel();
                  _disableTimer = Timer(const Duration(seconds: 5), (){
                    setState(() {
                      _isButtonDisabled = false;
                    });
                  });

                } : null,
                text: 'Descargar',
                color: isDarkMode ? colorScheme.surface : colorScheme.primary,
                icon: Icons.download,
              )
            ],
          ),
        )
    );
  }

  @override
  bool get wantKeepAlive => true;

}



