import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {

  final String usuario;
  final String correo;

  const UserInfo({
    super.key,
    required this.usuario,
    required this.correo
  });

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme.primary;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextStyles.autoTitleStyle(
              text: usuario,
              color: color,
              height: height
          ),
          AppTextStyles.autoBodyStyle(
              text: correo,
              color: color,
              height: height
          ),
        ],
      ),
    );
  }

}