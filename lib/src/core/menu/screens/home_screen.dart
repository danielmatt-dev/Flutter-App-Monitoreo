import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/widgets/reminder_card.dart';
import 'package:app_plataforma/src/features/valor/presentation/promedio/bloc/promedio_bloc.dart';
import 'package:app_plataforma/src/features/valor/presentation/promedio/widgets/average_card.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/valor/presentation/ingresar_valor/widgets/add_button.dart';

// <>
class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {

  late NotificacionBloc notificacionBloc;

  @override
  void initState() {
    super.initState();
    notificacionBloc = sl<NotificacionBloc>()..add(GetNotification());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider<PromedioBloc>(
        create: (context) => sl<PromedioBloc>()..add(const ObtenerPromedios()),
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                BlocBuilder<NotificacionBloc, NotificacionState>(
                    buildWhen: (previous, current) {
                      return current is NotificacionSuccess;
                      },
                    builder: (context, state) {
                      if(state is NotificacionLoading){
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is NotificacionSuccess){
                        return ReminderCard(
                          titulo: state.notificacion.titulo,
                          descripcion: state.notificacion.descripcion,
                        );
                      } else if (state is NotificacionError) {
                        return _buildErrorWidget(state.error);
                      } else {
                        return const Center(child: Text('Desconocido'),);
                      }
                    }
                    ),
                BlocBuilder<PromedioBloc, PromedioState>(
                    builder: (context, state) {
                      return state.when(
                          initial: () => const Center(child: Text('Inicio')),
                          loading: () => const Center(child: CircularProgressIndicator()),
                          success: (promedios) => Column(
                            children: promedios.map((promedio) =>
                            AverageCard(
                                titulo: promedio.medicion,
                                porcentaje: promedio.calcularPorcentaje(),
                                promedio: '${promedio.promedio}',
                                medida: promedio.medida,
                                valorMinimo: promedio.valorMinimo.toInt(),
                                valorMaximo: promedio.valorMaximo.toInt(),
                                color: promedio.buscarColor()
                            )).toList(),
                          ),
                          error: (message) => Center(child: Text(message)),
                      );
                    }
                    ),
              ],
            ),
          )
        )
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildErrorWidget(String error) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Error',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                error,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
