import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show({
    required BuildContext context,
    required TypeMessage typeMessage,
    required String title,
    required String description,
    int duration = 4,
    bool closed = true
  }) {

    final listColor = [
      mapColor['Verde'],
      mapColor['Neutro'],
      mapColor['Naranja'],
      mapColor['Rojo']
    ];

    final listIcons = [
      Icons.check_circle_rounded,
      Icons.info_rounded,
      Icons.error_rounded,
      Icons.cancel_rounded
    ];

    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final colorContainer = listColor[typeMessage.index];

    SnackBar snackBar = SnackBar(
      content: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorContainer, width: 2),
          color: colorContainer.withAlpha(20),
        ),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: colorContainer,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                listIcons[typeMessage.index],
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.8)
                            : Colors.black.withOpacity(0.8),
                        fontSize: SizeIcon.size16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.8)
                            : Colors.black.withOpacity(0.8),
                        fontSize: SizeIcon.size14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*
            if(closed)
            IconButton(
              onPressed: () {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                }
                },
              icon: Icon(
                Icons.close,
                color: isDarkMode
                    ? Colors.white.withOpacity(0.8)
                    : Colors.black.withOpacity(0.8),
              ),
            ),
             */
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      duration: Duration(seconds: duration),
      elevation: 0,
      backgroundColor: colorScheme.onPrimary,
      behavior: SnackBarBehavior.floating,
    );

    // Utiliza addPostFrameCallback para asegurar que el context está activo
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

}

enum TypeMessage { success, info, warning, error }