import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final bool center;
  final double size;
  final Widget? leading;

  const AppBarCustom({
    super.key,
    required this.title,
    this.center = true,
    this.size = SizeIcon.size26,
    this.leading
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: colorScheme.surface,
      centerTitle: center,
      title: AppTextStyles.autoBodyStyle(
          text: title,
          color: colorScheme.primary,
          size: size
      ),
      actions: leading != null
          ? [Padding(padding: const EdgeInsets.only(right: 16.0), child: leading),]
          : []
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}