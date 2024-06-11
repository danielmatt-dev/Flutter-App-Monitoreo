import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/widgets/reminder_card.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// <>
class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{
  late NotificacionBloc notificacionBloc;

  @override
  void initState() {
    super.initState();
    notificacionBloc = sl<NotificacionBloc>();
  }

  /*
  callNotificacion(){
    _notificacionBloc.add(
        ObtenerNotificacionPorId(1)
    );
  }
  
   */

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
        body: BlocProvider(
          create: (context) => notificacionBloc..add(ObtenerNotificacionPorId(1)),
          child: const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ReminderCard(),
                ],
              ),
            ),
          ),
        )
        //floatingActionButton: const AddButton()
    );
  }
}