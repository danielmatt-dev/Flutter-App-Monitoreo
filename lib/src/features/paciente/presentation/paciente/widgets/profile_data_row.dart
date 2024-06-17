import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProfileDataRow extends StatelessWidget {

  final String title;
  final String value;

  const ProfileDataRow({
    super.key,
    required this.title,
    required this.value
  });

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme.primary;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextStyles.autoBodyStyle(
                  text: '$title:',
                  color: color,
                  height: height,
                  percent: 0.02
                ),
                AppTextStyles.autoBodyStyle(
                    text: value,
                    color: color,
                    height: height,
                  percent: 0.02
                )
              ],
            ),
            const Divider(thickness: 1, color: Colors.grey,),
          ]
      ),
    );
  }

}