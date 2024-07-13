import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final bool center;
  final double percent;

  const AppBarCustom({
    super.key,
    required this.title,
    this.center = false,
    this.percent = 0.03
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: colorScheme.surface,
      centerTitle: center,
      title: AppTextStyles.autoBodyStyle(
          text: title,
          color: colorScheme.onBackground,
          height: height,
          percent: percent
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}