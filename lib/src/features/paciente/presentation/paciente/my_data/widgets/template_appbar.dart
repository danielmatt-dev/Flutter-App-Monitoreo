import 'package:app_plataforma/src/core/styles/app_button_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class TemplateAppBar extends StatelessWidget {

  final Widget child;
  final String title;

  const TemplateAppBar({
    super.key,
    required this.title,
    required this.child
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        title: AppTextStyles.autoBodyStyle(
            text: title,
            color: colorScheme.onBackground,
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
            onPressed: (){},
            icon: AppButtonStyles.iconStyle(
                iconData: Icons.check,
                height: height,
                color: mapColor['Verde']
            ),)
        ],
      ),
      body: child,
    );
  }

}