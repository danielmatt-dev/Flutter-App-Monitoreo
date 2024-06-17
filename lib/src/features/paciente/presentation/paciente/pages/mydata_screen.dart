import 'package:app_plataforma/src/core/menu/screens.dart';
import 'package:flutter/material.dart';

// <>
class MyDataScreen extends StatefulWidget {

  const MyDataScreen({super.key});

  @override
  State<MyDataScreen> createState() => _MyDataScreenState();

}

class _MyDataScreenState extends State<MyDataScreen> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {

    super.build(context);
    return const Scaffold(
      appBar: AppBarCustom(
        title: 'Mis datos',
        center: true,
      ),
      body: Center(
        child: Text('My Data'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}