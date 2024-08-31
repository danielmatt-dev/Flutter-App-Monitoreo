import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/widgets/card_recommendation.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralRecommendationsScreen extends StatefulWidget {

  const GeneralRecommendationsScreen({super.key});

  @override
  State<StatefulWidget> createState() =>  _GeneralRecommendationsScreenState();

}

class _GeneralRecommendationsScreenState extends State<GeneralRecommendationsScreen> with AutomaticKeepAliveClientMixin<GeneralRecommendationsScreen> {

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
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
                  children: state.notificaciones.map((notificacion) {
                    return CardRecommendation(
                      title: notificacion.titulo,
                      description: notificacion.descripcion,
                      type: notificacion.tipo,
                    );
                  }).toList(),
                );
              } else if (state is NotificacionError) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  CustomSnackbar.show(
                    context: context,
                    typeMessage: TypeMessage.error,
                    title: 'Error',
                    description: 'Vuelva a intentarlo más tarde',
                  );
                });
                return const SizedBox.shrink();
              } else {
                return const SizedBox.shrink();
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