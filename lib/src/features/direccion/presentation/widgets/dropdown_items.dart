import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

// <>
class DropdownItems extends StatelessWidget {

  final List<String> items;
  final String label;
  final String selectedItem;
  final ValueChanged<String?> onChanged;

  const DropdownItems({
    super.key,
    required this.items,
    required this.label,
    required this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return DropdownSearch<String>(
      items: items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: 'Colonia',
          labelStyle: AppTextStyles.bodyStyle(color: colorScheme.onBackground, size: height * 0.025),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: colorScheme.onBackground
              )

          ),
        ),
      ),
      onChanged: onChanged,
      selectedItem: items.first,
    );
  }
}