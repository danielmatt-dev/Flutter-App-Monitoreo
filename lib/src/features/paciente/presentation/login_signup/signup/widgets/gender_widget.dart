import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

// <>
class GenderWidget extends StatefulWidget {

  final String labelText;
  final ValueChanged<String> onGenderChanged;
  final String initialGender;

  const GenderWidget({
    super.key,
    required this.labelText,
    required this.onGenderChanged,
    required this.initialGender
  });

  @override
  State<GenderWidget> createState() => _GenderWidgetState();

}

class _GenderWidgetState extends State<GenderWidget> {

  late bool isMaleSelected;

  @override
  void initState() {
    super.initState();
    isMaleSelected = widget.initialGender == 'Hombre';
  }

  void selectGender(bool isMale){
    setState(() {
      isMaleSelected = isMale;
      widget.onGenderChanged(isMale ? 'Hombre' : 'Mujer');
    });
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextStyles.autoBodyStyle(
              text: widget.labelText,
              color: colorScheme.primary,
          ),

          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.01),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => selectGender(true),
              child: Container(
                height: 45,
                width: 130,
                decoration: BoxDecoration(
                  color: isMaleSelected ? colorScheme.primary : colorScheme.surface,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.male,
                      color: isMaleSelected ? colorScheme.onPrimary : colorScheme.primary,
                      size: 25,
                    ),
                    AppTextStyles.autoBodyStyle(
                        text: 'Hombre',
                        color: isMaleSelected ? colorScheme.onPrimary : colorScheme.primary,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => selectGender(false),
              child: Container(
                height: 45,
                width: 130,
                decoration: BoxDecoration(
                    color: !isMaleSelected ? colorScheme.primary : colorScheme.surface,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.female,
                      color: !isMaleSelected ? colorScheme.onPrimary : colorScheme.primary,
                      size: 25,
                    ),
                    AppTextStyles.autoBodyStyle(
                        text: 'Mujer',
                        color: !isMaleSelected ? colorScheme.onPrimary : colorScheme.primary,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ]
    );

  }

}