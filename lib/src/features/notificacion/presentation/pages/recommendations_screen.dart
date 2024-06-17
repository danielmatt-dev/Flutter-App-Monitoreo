import 'package:app_plataforma/src/core/menu/screens.dart';
import 'package:flutter/material.dart';

// <>
class RecommendationsScreen extends StatefulWidget {

  const RecommendationsScreen({super.key});

  @override
  State<RecommendationsScreen> createState() => _RecommendationsScreenState();

}

class _RecommendationsScreenState extends State<RecommendationsScreen> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {

    super.build(context);
    return const Scaffold(
      appBar: AppBarCustom(
        title: 'Recomendaciones',
        center: true,
      ),
      body: Center(
        child: Text('Recomendaciones'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}