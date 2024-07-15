import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdownButton extends StatelessWidget {

  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: AppTextStyles.autoBodyStyle(
            text: 'Seleccionar medición',
            color: colorScheme.onBackground,
            height: height,
            percent: 0.022
        ),
        items: items.map((item) =>
            DropdownMenuItem<String>(
              value: item,
              child: AppTextStyles.autoBodyStyle(
                  text: item,
                  color: colorScheme.onBackground,
                  height: height,
                  textAlign: TextAlign.start
              ),
            )).toList(),
        value: selectedValue,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 35,
          width: 200,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: colorScheme.background,
          ),
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(Icons.arrow_forward_ios_outlined,),
          iconSize: 14,
          iconEnabledColor: colorScheme.onBackground,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 60,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: colorScheme.background,
          ),
          offset: const Offset(0, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
        style: AppTextStyles.bodyStyle(
            color: colorScheme.onBackground,
            size: height * 0.022
        ),
      ),
    );
  }
}
