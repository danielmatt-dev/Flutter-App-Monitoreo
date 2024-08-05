import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show({
    required BuildContext context,
    required TypeMessage typeMessage,
    required String title,
    required String description,
    int duration = 5,
    bool closed = true
  }) {
    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    final colorContainer = getColor(typeMessage);

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
                getIcon(typeMessage),
                color: colorScheme.onPrimary,
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
                        color: Colors.black.withOpacity(0.8),
                        fontSize: height * 0.022,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: height * 0.02,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if(closed)
            IconButton(
              onPressed: () { ScaffoldMessenger.of(context).hideCurrentSnackBar();},
              icon: Icon(
                Icons.close,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
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

  static Color getColor(TypeMessage type){
    if(type == TypeMessage.success){
      return mapColor['Verde'];
    }

    if(type == TypeMessage.info){
      return mapColor['Neutro'];
    }

    if(type == TypeMessage.warning){
      return mapColor['Naranja'];
    }

    return mapColor['Rojo'];
  }

  static IconData getIcon(TypeMessage type){
    if(type == TypeMessage.success){
      return Icons.check_circle_rounded;
    }

    if(type == TypeMessage.info){
      return Icons.info_rounded;
    }

    if(type == TypeMessage.warning){
      return Icons.error_rounded;
    }

    return Icons.cancel_rounded;
  }

}

enum TypeMessage { success, info, warning, error }