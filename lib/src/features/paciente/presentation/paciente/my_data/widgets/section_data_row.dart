import 'package:app_plataforma/src/core/styles/app_button_styles.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/profile_data_row.dart';
import 'package:flutter/material.dart';

class SectionDataRow extends StatelessWidget {

  final String labelText;
  final Map<String, String> map;
  final bool enabled;
  final void Function()? onPressed;

  const SectionDataRow({
    super.key,
    required this.labelText,
    required this.map,
    this.enabled = true,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 12),
      color: colorScheme.onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextStyles.autoBodyStyle(
                    text: labelText,
                    color: colorScheme.primary,
                    height: height
                ),
                if (enabled)
                  IconButton(
                    onPressed: onPressed,
                    icon: AppButtonStyles.iconStyle(
                        iconData: Icons.edit,
                        height: height,
                        percentage: 0.03,
                        color: colorScheme.primary
                    ),
                  )
              ]
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.01),
            ...map.entries.map((entry) {
              if (entry.key == 'Fecha de nacimiento' ||
                  entry.key == 'genero' ||
                  entry.key == 'estadocivil' ||
                  entry.key == 'peso' ||
                  entry.key == 'talla'
              ) {
                return const SizedBox.shrink();
              }
              return ProfileDataRow(
                title: entry.key,
                value: entry.value,
              );
            }),
          ],
        ),
      ),
    );
  }

}
