import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdownButton extends StatelessWidget {

  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final double width;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? borderSelectedColor;
  final String label;
  final double height;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.label,
    this.width = 250,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderSelectedColor,
    this.height = 50
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: height,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: AppTextStyles.autoBodyStyle(
              text: label,
              color: textColor ?? colorScheme.primary,
          ),
          items: items.map((item) =>
              DropdownMenuItem<String>(
                value: item,
                child: AppTextStyles.autoBodyStyle(
                    text: item,
                    color: textColor ?? colorScheme.primary,
                    textAlign: TextAlign.start,
                ),
              )).toList(),
          value: selectedValue,
          onChanged: onChanged,
          buttonStyleData: ButtonStyleData(
            height: height,
            width: width,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: backgroundColor,
                border: Border.all(color: selectedValue != null
                    ? borderSelectedColor ?? colorScheme.primary
                    : borderColor ?? colorScheme.primary.withOpacity(0.4)
                )
            ),
          ),
          iconStyleData: IconStyleData(
            icon: const Icon(Icons.arrow_forward_ios_outlined,),
            iconSize: 14,
            iconEnabledColor: colorScheme.primary,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 500,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: backgroundColor,
            ),
            offset: const Offset(0, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: WidgetStateProperty.all<double>(6),
              thumbVisibility: WidgetStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
          style: AppTextStyles.bodyStyle(
              color: colorScheme.primary,
              size: SizeIcon.size16,
          ),
        ),
      ),
    );
  }
}
