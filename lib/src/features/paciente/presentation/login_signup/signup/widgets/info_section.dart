import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final IconData icon;

  const InfoSection({
    super.key,
    required this.title,
    required this.children,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextStyles.autoBodyStyle(
                text: title,
                color: colorScheme.onBackground,
                height: height
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(children: children,),
            )
          ],
        ),
      ),
    );

  }
}