import 'package:app_plataforma/src/core/styles/app_button_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class TemplateAppBar extends StatelessWidget {

  final Widget child;
  final String title;
  final VoidCallback onPressed;

  const TemplateAppBar({
    super.key,
    required this.title,
    required this.child,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.onPrimary,
        appBar: AppBar(
          backgroundColor: colorScheme.surface,
          elevation: 0,
          title: AppTextStyles.autoBodyStyle(
              text: title,
              color: colorScheme.primary,
              height: height,
              percent: 0.03
          ),
          centerTitle: true,
          leading: IconButton(
            icon: AppButtonStyles.iconStyle(
                iconData: Icons.close,
                height: height,
                color: mapColor['Rojo']
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              onPressed: onPressed,
              icon: AppButtonStyles.iconStyle(
                  iconData: Icons.check,
                  height: height,
                  color: mapColor['Verde']
              ),)
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              child,
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mapColor['Verde'],
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: AppTextStyles.autoBodyStyle(
                        text: 'Actualizar',
                        color: isDarkMode ? colorScheme.primary : colorScheme.onPrimary,
                        height: height,
                        percent: 0.03
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}