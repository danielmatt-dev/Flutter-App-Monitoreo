import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/widgets/card_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// <>
class PersonalRecommendationsScreen extends StatefulWidget{

  const PersonalRecommendationsScreen({super.key});

  @override
  State<PersonalRecommendationsScreen> createState() => _DataRecommendationsPersonalScreen();

}

class _DataRecommendationsPersonalScreen extends State<PersonalRecommendationsScreen> with AutomaticKeepAliveClientMixin<PersonalRecommendationsScreen> {

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<NotificacionBloc, NotificacionState>(
            builder: (context, state) {
              if (state is NotificacionLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ListNotificacionesSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.personales.map((notificacion) {
                    return CardRecommendation(
                      title: notificacion.titulo,
                      description: notificacion.descripcion,
                      type: notificacion.tipo,
                    );
                  }).toList(),
                );
              } else if (state is NotificacionError) {
                return Center(child: Text(state.error));
              } else {
                return const Center(child: Text('Desconocido'));
              }
            },
          ),
        ),
      ),
    );

  }

  @override
  bool get wantKeepAlive => true;

}