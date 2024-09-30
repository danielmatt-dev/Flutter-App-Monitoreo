import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SplashIconScreen extends StatefulWidget {

  final List<String> titles;
  final List<String> descriptions;
  final List<IconData> icons;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? nextScreen;
  final VoidCallback? onPressed;
  final bool withSkip;

  const SplashIconScreen({
    super.key,
    required this.titles,
    required this.descriptions,
    required this.icons,
    this.backgroundColor,
    this.foregroundColor,
    this.nextScreen,
    this.onPressed,
    this.withSkip = true
  });

  @override
  State<SplashIconScreen> createState() => _SplashIconScreenState();
}

class _SplashIconScreenState extends State<SplashIconScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    _controller.forward();
  }

  void _updateText(int index) {
    setState(() {
      _currentIndex = index;
      _controller.reset();
      _controller.forward();
    });
  }

  void _onFloatingButtonPressed() {
    if (_currentIndex < widget.titles.length - 1) {
      _updateText(_currentIndex + 1);
      return;
    }

    widget.onPressed?.call();

    if(widget.nextScreen == null){
      return;
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => widget.nextScreen!
        )
    );
  }

  void _onDotPressed(int index) {
    _updateText(index);
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.backgroundColor ?? colorScheme.secondary,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              if(widget.withSkip)
              GestureDetector(
                onTap: (){
                  widget.onPressed?.call();

                  if(widget.nextScreen == null){
                    return;
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => widget.nextScreen!
                      )
                  );
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: AppTextStyles.autoBodyStyle(
                      text: 'Saltar',
                      color: widget.foregroundColor ?? colorScheme.onPrimary,
                      horizontal: 16,
                      vertical: 10,
                      size: SizeIcon.size14,
                    )
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.05),
                    Container(
                      width: height * 0.3,
                      height: height * 0.3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.foregroundColor?.withOpacity(0.2) ?? Colors.white.withOpacity(0.2),
                      ),
                      child: Center(
                        child: FadeTransition(
                          opacity: _animation,
                          child: Icon(
                            widget.icons[_currentIndex],
                            size: height * 0.15,
                            color: widget.foregroundColor ?? Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.05),
                    FadeTransition(
                      opacity: _animation,
                      child: AppTextStyles.autoTitleStyle(
                        text: widget.titles[_currentIndex],
                        color: widget.foregroundColor ?? Colors.white.withOpacity(0.9),
                        maxLines: 5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: FadeTransition(
                        opacity: _animation,
                        child: AppTextStyles.autoBodyStyle(
                          text: widget.descriptions[_currentIndex],
                          color: widget.foregroundColor ?? Colors.white.withOpacity(0.9),
                          maxLines: 10,
                          textAlign: TextAlign.center,
                          size: SizeIcon.size18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: widget.descriptions.asMap().entries.map((entry) {
                  int index = entry.key;
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => _onDotPressed(index),
                        child: Container(
                          width: _currentIndex == index
                              ? 14 : 12,
                          height: _currentIndex == index
                              ? 14 : 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? widget.foregroundColor?.withOpacity(0.8) ?? Colors.white.withOpacity(0.8)
                                : widget.foregroundColor?.withOpacity(0.4) ?? Colors.white.withOpacity(0.4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,)
                    ]
                  );
                }).toList(),
              ),
                              ),
              FloatingActionButton(
                onPressed: _onFloatingButtonPressed,
                backgroundColor: widget.foregroundColor ?? Colors.white,
                child: Icon(Icons.navigate_next, color: widget.backgroundColor ?? colorScheme.secondary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}