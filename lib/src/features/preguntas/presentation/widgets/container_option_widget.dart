import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ContainerOptionWidget extends StatefulWidget {
  final IconData icon;
  final Function()? onTap;
  final String title;

  const ContainerOptionWidget({
    super.key,
    required this.icon,
    this.onTap,
    required this.title,
  });

  @override
  State<ContainerOptionWidget> createState() => _ContainerOptionWidgetState();

}

class _ContainerOptionWidgetState extends State<ContainerOptionWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.95,
      upperBound: 1.0,
    );
    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.reverse();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.forward();
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final color = isDarkMode ? colorScheme.onPrimary : colorScheme.primary;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => _controller.forward(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.background,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          height: height * 0.18,
          width: height * 0.2,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: height * 0.03,
                    backgroundColor: color.withOpacity(0.1),
                    child: Icon(
                      widget.icon,
                      size: height * 0.04,
                      color: color,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextStyles.autoBodyStyle(
                        text: widget.title,
                        color: color,
                        height: height,
                        percent: 0.02
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, size: 15, color: color)
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
