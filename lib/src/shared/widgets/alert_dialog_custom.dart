import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AlertDialogCustom extends StatelessWidget {

  final String title;
  final String optionOne;
  final String optionTwo;
  final Color? titleColor;
  final Color? backgroundColor;
  final Color? containerColor;
  final Color? firstOptionColor;
  final Color? firstOptionTextColor;
  final Color? secondOptionTextColor;
  final Color? secondOptionColor;
  final VoidCallback? onFirstPressed;
  final VoidCallback? onSecondPressed;
  final IconData? icon;

  const AlertDialogCustom({
    super.key,
    required this.title,
    required this.optionOne,
    required this.optionTwo,
    this.titleColor,
    this.firstOptionColor,
    this.secondOptionColor,
    this.firstOptionTextColor,
    this.secondOptionTextColor,
    required this.onFirstPressed,
    required this.onSecondPressed,
    this.backgroundColor,
    this.containerColor,
    this.icon
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: backgroundColor ?? colorScheme.onPrimary,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: containerColor ?? colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: backgroundColor ?? colorScheme.onPrimary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.question_mark_rounded,
                          size: 60,
                          color: containerColor ?? colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              child: Column(
                children: [
                  AppTextStyles.autoBodyStyle(
                    text: title,
                    color: titleColor ?? containerColor ?? colorScheme.primary,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ElevatedButton(
                            onPressed: onFirstPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: firstOptionColor ?? containerColor ?? colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                optionOne,
                                style: TextStyle(
                                  color: firstOptionTextColor ?? backgroundColor ?? colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ElevatedButton(
                            onPressed: onSecondPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondOptionColor ?? containerColor ?? colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                optionTwo,
                                style: TextStyle(
                                  color: secondOptionTextColor ?? backgroundColor ?? colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}