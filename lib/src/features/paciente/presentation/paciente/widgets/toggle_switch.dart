import 'package:flutter/material.dart';

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

    var screenSize = MediaQuery.of(context).size;

    return Switch(
      value: widget.value,
      onChanged: widget.onChanged,
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
      materialTapTargetSize: screenSize.width > 600
          ? MaterialTapTargetSize.padded
          : MaterialTapTargetSize.shrinkWrap,
    );
  }
}
