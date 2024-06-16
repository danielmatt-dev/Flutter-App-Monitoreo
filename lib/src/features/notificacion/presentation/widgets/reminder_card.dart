import 'package:app_plataforma/src/core/styles/app_button_styles.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// <>
class ReminderCard extends StatelessWidget {

  final String titulo;
  final String descripcion;

  const ReminderCard({
    super.key,
    required this.titulo,
    required this.descripcion
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Card(
              color: colorScheme.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                                color: colorScheme.onPrimary,
                                textAlign: TextAlign.start,
                                height: height
                            )
                        ),
                        AppButtonStyles.iconStyle(
                          iconData: Icons.notifications_active,
                          height: height,
                          color: colorScheme.onPrimary,
                        )
                      ],
                    ),
                    AppSizeBoxStyle.sizeBox(height: height),
                    AppTextStyles.autoTitleStyle(
                        text: titulo,
                        color: colorScheme.onPrimary,
                        textAlign: TextAlign.start,
                        height: height
                    ),
                    AppSizeBoxStyle.sizeBox(height: height),
                    AppTextStyles.autoBodyStyle(
                        text: descripcion,
                        color: colorScheme.onPrimary,
                        maxLines: 3,
                        height: height
                    ),
                    AppSizeBoxStyle.sizeBox(height: height),
                  ],
                ),
              ),
            );

  }

}