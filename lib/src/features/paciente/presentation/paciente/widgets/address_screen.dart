import 'package:app_plataforma/src/core/menu/screens.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {

  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();

}

class _AddressScreenState extends State<AddressScreen> with AutomaticKeepAliveClientMixin {

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