import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/shared/widgets/dropdown_button_custom.dart';
import 'package:flutter/material.dart';

class DropdownButtomTitle extends StatelessWidget {

  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final double heightList;
  final double heightButton;
  final double width;
  final Color? backgroundColor;
  final String label;
  final String labelTitle;
  final VoidCallback? onPressed;
  final bool helpIcon;

  const DropdownButtomTitle({
    super.key,
    required this.items,
    required this.labelTitle,
    required this.selectedValue,
    required this.onChanged,
    required this.label,
    required this.heightButton,
    required this.heightList,
    this.width = 250,
    this.backgroundColor,
    this.onPressed,
    this.helpIcon = false
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final brightness = Theme.of(context).brightness;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextStyles.autoBodyStyle(
                    text: labelTitle,
                    color: colorScheme.primary,
                ),
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(helpIcon
                        ? Icons.help_outline_rounded
                        : null,
                      color: colorScheme.primary,
                      size: 18,
                    )
                )
              ]
          ),
          Row(
              children: [
                Expanded(
                  child: CustomDropdownButton(
                      items: items,
                      selectedValue: selectedValue,
                      onChanged: onChanged,
                      label: label,
                      width: height*0.40,
                      backgroundColor: brightness == Brightness.light
                          ? Colors.white
                          : Colors.black
                  ),
                ),
              ]
          ),
        ]
    );

  }

}