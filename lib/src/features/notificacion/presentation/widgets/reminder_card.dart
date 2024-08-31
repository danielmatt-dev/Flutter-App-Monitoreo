import 'package:app_plataforma/src/core/styles/app_button_styles.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

// <>
class ReminderCard extends StatelessWidget {

  final String titulo;
  final String descripcion;
  final Color backgroundColor;
  final Color foregroundColor;

  const ReminderCard({
    super.key,
    required this.titulo,
    required this.descripcion,
    required this.backgroundColor,
    required this.foregroundColor
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Card(
      color: backgroundColor,
      elevation: 5,
      child: Padding(
        padding:  const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: AppTextStyles.autoTitleStyle(
                        text: 'Recuerda',
                        color: foregroundColor,
                        textAlign: TextAlign.start,
                        height: height
                    )
                ),
                AppButtonStyles.iconStyle(
                  iconData: Icons.notifications_active,
                  height: height,
                  color: foregroundColor,
                )
              ],
            ),
            AppSizeBoxStyle.sizeBox(height: height),
            AppTextStyles.autoTitleStyle(
              text: titulo,
              color: foregroundColor,
              textAlign: TextAlign.start,
              height: height,
              maxLines: 2,
              percent: 0.03
            ),
            AppSizeBoxStyle.sizeBox(height: height),
            AppTextStyles.autoBodyStyle(
                text: descripcion,
                color: foregroundColor,
                maxLines: 4,
                height: height
            )
          ],
        ),
      ),
    );
  }

}