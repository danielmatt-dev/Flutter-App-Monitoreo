import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/pages/measurement_entry_screen.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AddButton extends StatefulWidget {

  const AddButton({super.key});

  @override
  State<AddButton> createState() => _AddButtonState();

}

class _AddButtonState extends State<AddButton> {

  bool isDialOpen = false;

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    //ValueNotifier<bool> isDialOpen = ValueNotifier(false);

    return  SpeedDial(
      curve: Curves.bounceInOut,
      backgroundColor: colorScheme.onBackground,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      icon: isDialOpen ? Icons.close : Icons.add,
      overlayOpacity: 0.9,
      children: [
        SpeedDialChild(
          elevation: 2,
          backgroundColor: colorScheme.background,
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 40.0,
              minHeight: 40.0,
              maxWidth: 40.0,
              maxHeight: 40.0,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary,
            ),
            child: Icon(Icons.dark_mode, size: 20, color: colorScheme.onPrimary),
          ),
          labelWidget: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    'Presión Arterial',
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 40.0,
                      minHeight: 40.0,
                      maxWidth: 40.0,
                      maxHeight: 40.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.primary,
                    ),
                    child: Icon(Icons.add, size: 20, color: colorScheme.onPrimary),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

  }


  SpeedDialChild _dialChild({
    required double height,
    required ColorScheme colorScheme,
    required IconData iconData,
    required String label,
    required VoidCallback onTap,
  }) {
    return SpeedDialChild(
      elevation: 2,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 40.0,
          minHeight: 40.0,
          maxWidth: 40.0,
          maxHeight: 40.0,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorScheme.primary,
        ),
        child: Icon(iconData, size: 20, color: colorScheme.onPrimary),
      ),
      label: label,
      labelBackgroundColor: colorScheme.background,
      labelStyle: TextStyle(
        color: colorScheme.onBackground,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      onTap: onTap,
    );
  }
}