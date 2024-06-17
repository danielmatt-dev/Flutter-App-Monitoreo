import 'package:app_plataforma/src/core/menu/screens.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {

  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();

}

class _PasswordScreenState extends State<PasswordScreen> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {

    super.build(context);
    return const Scaffold(
      appBar: AppBarCustom(
        title: 'Password',
        center: true,
      ),
      body: Center(
        child: Text('Password'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}