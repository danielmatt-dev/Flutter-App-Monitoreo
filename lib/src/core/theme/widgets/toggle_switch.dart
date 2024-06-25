import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToggleSwitch extends StatefulWidget {

  final bool value;
  final ValueChanged<bool> onChanged;

  const ToggleSwitch({
    super.key,
    required this.value,
    required this.onChanged
  });

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();

}

class _ToggleSwitchState extends State<ToggleSwitch> {

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon( widget.value ? Icons.dark_mode : Icons.light_mode ,
              color: colorScheme.onBackground),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AppTextStyles.autoBodyStyle(
                  text: 'Modo oscuro',
                  color: colorScheme.onBackground,
                  height: height,
                  percent: 0.025
              ),
            ),
          const Spacer(),
          Switch(
          value: widget.value,
          onChanged: widget.onChanged,
          activeTrackColor: colorScheme.surface,
          activeColor: colorScheme.primary,
          materialTapTargetSize: width > 600
              ? MaterialTapTargetSize.padded
              : MaterialTapTargetSize.shrinkWrap,
                ),
        ]
      ),
    );
  }
}
