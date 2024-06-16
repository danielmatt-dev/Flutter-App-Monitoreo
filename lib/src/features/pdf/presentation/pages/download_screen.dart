import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/pdf/presentation/widgets/download_button.dart';
import 'package:app_plataforma/src/features/pdf/presentation/widgets/select_measurement.dart';
import 'package:app_plataforma/src/features/pdf/presentation/widgets/select_period.dart';
import 'package:flutter/material.dart';

class DownloadScreen extends StatefulWidget {

  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  String selectedMedicion = 'Glucosa';
  String selectedPeriodo = '4 semanas';

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
          const SelectMeasurement(),
          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.025),
          const SelectPeriod(),
          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.025),
          const DownloadButton()
        ],
      ),
    );
  }
}



