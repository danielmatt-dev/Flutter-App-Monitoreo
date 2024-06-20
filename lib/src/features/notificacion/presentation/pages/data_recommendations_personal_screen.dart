import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_personal/notificacion_personal_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/widgets/card_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// <>
class DataRecommendationsPersonalScreen extends StatefulWidget{

  const DataRecommendationsPersonalScreen({super.key});

  @override
  State<DataRecommendationsPersonalScreen> createState() => _DataRecommendationsPersonalScreen();

}

class _DataRecommendationsPersonalScreen extends State<DataRecommendationsPersonalScreen> with AutomaticKeepAliveClientMixin<DataRecommendationsPersonalScreen> {

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<NotificacionPersonalBloc, NotificacionPersonalState>(
            builder: (context, state) {
              return state.when(
                  initial: () => const Center(child: Text('Inicio')),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  success: (notificaciones) => Column(
                    children: notificaciones.map((notificacion) =>
                    CardRecommendation(
                        title: notificacion.titulo,
                        description: notificacion.descripcion
                    )).toList(),
                  ),
                  error: (message) => Center(child: Text(message)),
              );
            },
          ),
        ),
      ),
    );

  }

  @override
  bool get wantKeepAlive => true;

}