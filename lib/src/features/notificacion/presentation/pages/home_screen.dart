import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/widgets/reminder_card.dart';
import 'package:app_plataforma/src/features/promedio/presentation/bloc/promedio_bloc.dart';
import 'package:app_plataforma/src/features/promedio/presentation/widgets/average_card.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';

// <>
class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{
  late NotificacionBloc notificacionBloc;
  late PromedioBloc promedioBloc;

  @override
  void initState() {
    super.initState();
    notificacionBloc = sl<NotificacionBloc>();
    promedioBloc = sl<PromedioBloc>();
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.background,
          title: AppTextStyles.autoTitleStyle(
              text: 'Bienvenido!',
              color: colorScheme.onBackground,
              height: height
          ),
          centerTitle: false,
        ),
        body: const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ReminderCard(),
                  AverageCard(),
                  AverageCard(),
                  AverageCard()
                ],
              ),
              //floatingActionButton: const AddButton()
            ),
          ),
        );
  }
}