import 'package:app_plataforma/src/core/menu/screens.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {

  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();

}

class _AboutScreenState extends State<AboutScreen> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {

    super.build(context);
    return const Scaffold(
      appBar: AppBarCustom(
        title: 'Acerca De',
        center: true,
      ),
      body: Center(
        child: Text('Acerca De'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}