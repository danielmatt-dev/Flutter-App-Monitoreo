import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {

  const DownloadButton({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.download),
        label: AppTextStyles.autoButtonStyle(
          text: 'Descargar',
          color: colorScheme.onPrimary,
          height: height,
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: colorScheme.background,
          backgroundColor: colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 12),
          minimumSize: Size(double.infinity, height*0.03),
          maximumSize: Size(double.infinity, height*0.12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );
  }

}