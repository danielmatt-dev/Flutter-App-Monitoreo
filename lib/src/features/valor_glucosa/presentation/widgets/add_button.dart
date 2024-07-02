import 'package:app_plataforma/src/features/valor_glucosa/presentation/pages/measurement_entry_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AddButton extends StatefulWidget {

  const AddButton({super.key});

  @override
  State<AddButton> createState() => _AddButtonState();

}

class _AddButtonState extends State<AddButton> {

  bool isDialOpen = false;

  void _toggleSpeedDial() {
    setState(() {
      isDialOpen = !isDialOpen;
    });
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return SpeedDial(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      icon: isDialOpen ? Icons.close : Icons.add,
      activeIcon: Icons.close,
      backgroundColor: colorScheme.primary,
      onOpen: _toggleSpeedDial,
      onClose: _toggleSpeedDial,
      curve: Curves.bounceInOut,
      children: [
        _dialChild(
            height: height,
            colorScheme: colorScheme,
            iconData: Icons.healing,
            label: 'Presión',
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MeasurementEntryScreen(isGlucose: false),
          )),
        ),
        _dialChild(
            height: height,
            colorScheme: colorScheme,
            iconData: Icons.bloodtype,
            label: 'Glucosa',
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MeasurementEntryScreen(isGlucose: true),
          )),
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child: Icon(iconData, size: 24, color: colorScheme.primary),
      foregroundColor: colorScheme.primary,
      backgroundColor: colorScheme.surface,
      label: label,
      labelWidget: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Text(
          label,
          style: TextStyle(
              color: colorScheme.primary, fontSize: height * 0.03),
        ),
      ),
      onTap: onTap,
    );
  }
}