import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/widgets/card_recommendation.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataRecommendationsScreen extends StatefulWidget {

  const DataRecommendationsScreen({super.key});

  @override
  State<StatefulWidget> createState() =>  _DataRecommendationsScreenState();

}

class _DataRecommendationsScreenState extends State<DataRecommendationsScreen> with AutomaticKeepAliveClientMixin {

  late NotificacionBloc notificacionBloc;

  @override
  void initState(){
    super.initState();
    notificacionBloc = sl<NotificacionBloc>()..add(ObtenerNotificaciones());
  }

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
              } else if (state is ListaNotificacionesSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.notificaciones.map((notificacion) {
                    return CardRecommendation(
                        title: notificacion.titulo,
                        description: notificacion.descripcion
                    );
                  }).toList(),
                );
              } else if (state is NotificacionError) {
                return Center(child: Text(state.error));
              } else {
                print('Desconocido lista');
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