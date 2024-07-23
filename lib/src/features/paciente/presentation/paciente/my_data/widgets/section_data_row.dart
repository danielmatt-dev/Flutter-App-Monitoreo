import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/profile_data_row.dart';
import 'package:flutter/material.dart';

class SectionDataRow extends StatelessWidget {

  final String labelText;
  final Map<String, dynamic> map;

  const SectionDataRow({
    super.key,
    required this.labelText,
    required this.map
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.symmetric(vertical: 12),
      color: colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextStyles.autoBodyStyle(
                text: labelText,
                color: colorScheme.onBackground,
                height: height
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.01),
            ...map.entries.map((entry) =>
                ProfileDataRow(
                  title: entry.key,
                  value: entry.value,
                )
            )
          ],
        ),
      ),
    );
  }

}
