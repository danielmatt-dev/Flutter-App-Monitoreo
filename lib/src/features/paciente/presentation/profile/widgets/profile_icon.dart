import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {

  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
          color: colorScheme.onPrimary,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: colorScheme.primary, width: 2)
      ),
      child: Center(
        child: Icon(
          Icons.person,
          color: colorScheme.primary,
          size: 60,
        ),
      ),
    );
  }
}