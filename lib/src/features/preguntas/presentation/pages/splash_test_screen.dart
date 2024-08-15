import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/pages/test_screen.dart';
import 'package:flutter/material.dart';

class SplashTestScreen extends StatefulWidget {
  const SplashTestScreen({super.key});

  @override
  State<SplashTestScreen> createState() => _SplashTestScreenState();
}

class _SplashTestScreenState extends State<SplashTestScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;

  final _titles = [
    'Objetivo',
    'Confidencialidad',
  ];

  final _descriptions = [
    'Identificar los aspectos relacionados con el autocuidado de la diabetes para poder ofrecer alternativas para su mejora',
    'Tenga la confianza de responder con sinceridad todas las preguntas para identificar más claramente sus necesidades',
  ];

  final _icons = [
    Icons.fact_check_rounded,
    Icons.health_and_safety_rounded
  ];

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
    if (_currentIndex < _titles.length - 1) {
      _updateText(_currentIndex + 1);
      return;
    }

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TestScreen())
    );
  }

  void _onDotPressed(int index) {
    _updateText(index);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.secondary,
      body: Stack(
        children: [
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
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Center(
                    child: FadeTransition(
                      opacity: _animation,
                      child: Icon(
                        _icons[_currentIndex],
                        size: height * 0.15,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ),
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.05),
                FadeTransition(
                  opacity: _animation,
                  child: AppTextStyles.autoTitleStyle(
                    text: _titles[_currentIndex],
                    color: colorScheme.onPrimary,
                    height: height,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: FadeTransition(
                    opacity: _animation,
                    child: AppTextStyles.autoBodyStyle(
                      text: _descriptions[_currentIndex],
                      color: colorScheme.onPrimary,
                      height: height,
                      maxLines: 10,
                      textAlign: TextAlign.center,
                      percent: 0.022
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _onDotPressed(0),
                    child: Container(
                      width: _currentIndex == 0
                          ? 14
                          : 12,
                      height: _currentIndex == 0
                          ? 14
                          : 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == 0
                            ? Colors.white.withOpacity(0.8)
                            : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => _onDotPressed(1),
                    child: Container(
                      width: _currentIndex == 1
                          ? 14
                          : 12,
                      height: _currentIndex == 1
                          ? 14
                          : 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == 1
                            ? Colors.white.withOpacity(0.8)
                            : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FloatingActionButton(
              onPressed: _onFloatingButtonPressed,
              backgroundColor: Colors.white,
              child: Icon(Icons.navigate_next, color: colorScheme.secondary),
            ),
          ],
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