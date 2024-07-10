import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/valor_pdf/presentation/cubit/pdf_cubit.dart';
import 'package:app_plataforma/src/features/valor_pdf/presentation/widgets/icon_button_custom.dart';
import 'package:app_plataforma/src/features/valor_pdf/presentation/widgets/select_measurement.dart';
import 'package:app_plataforma/src/features/valor_pdf/presentation/widgets/select_period.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadScreen extends StatefulWidget {

  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> with AutomaticKeepAliveClientMixin<DownloadScreen> {

  String measurement = 'Glucosa';
  int range = 4;

  @override
  Widget build(BuildContext context) {

    super.build(context);

    final height = MediaQuery.of(context).size.height;
    final color = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: BlocProvider<PdfCubit>(
        create: (context) => sl<PdfCubit>(),
        child: Scaffold(
          body: Column(
            children: [
              SelectMeasurement(
                onMeasurementChanged: (value) {
                  setState(() {
                    measurement = value;
                  });
                },
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.025),
              SelectPeriod(
                onPeriodChanged: (value) {
                  setState(() {
                    range = value;
                  });
                },
              ),
              const Spacer(),
              IconButtonCustom(
                onPressed: () {
                  sl<PdfCubit>().generarPdf(
                      rango: range,
                      medicion: measurement
                  );
                },
                text: 'Descargar',
                color: color,
                icon: Icons.download,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}



