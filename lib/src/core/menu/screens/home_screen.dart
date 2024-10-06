import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/widgets/reminder_card.dart';
import 'package:app_plataforma/src/features/valor/presentation/promedio/bloc/promedio_bloc.dart';
import 'package:app_plataforma/src/features/valor/presentation/promedio/widgets/average_card.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// <>
class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {

  final promedioBloc = sl<PromedioBloc>();
  late NotificacionBloc notificacionBloc;
  bool showError = true;

  @override
  void initState() {
    super.initState();
    notificacionBloc = sl<NotificacionBloc>()..add(GetNotification());
  }

  void _showSnackbarError() {
    if(showError) {
      CustomSnackbar.show(
        context: context,
        typeMessage: TypeMessage.error,
        title: MessagesSnackbar.error,
        description: MessagesSnackbar.messageConnectionError,
      );
      showError = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
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
                    backgroundColor: isDarkMode ? colorScheme.surface : colorScheme.primary,
                    foregroundColor: isDarkMode ? colorScheme.primary : colorScheme.onPrimary,
                  );
                } else if (state is NotificacionError) {
                  _showSnackbarError();
                  return const SizedBox.shrink();
                } else {
                  return const SizedBox.shrink();
                }
              }
              ),
          BlocBuilder<PromedioBloc, PromedioState>(
            bloc: promedioBloc..add(const ObtenerPromedios()),
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
                  error: (_) {
                    _showSnackbarError();
                    return const SizedBox.shrink();
                    },
                );
              }
              ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}
