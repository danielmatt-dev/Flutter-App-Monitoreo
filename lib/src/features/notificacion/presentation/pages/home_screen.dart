import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/widgets/reminder_card.dart';
import 'package:app_plataforma/src/features/promedio/presentation/bloc/promedio_bloc.dart';
import 'package:app_plataforma/src/features/promedio/presentation/widgets/average_card.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// <>
class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {

  late NotificacionBloc notificacionBloc;
  late PromedioBloc promedioBloc;

  @override
  void initState() {
    super.initState();
    notificacionBloc = sl<NotificacionBloc>();
    promedioBloc = sl<PromedioBloc>()..add(ObtenerPromedios());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.background,
          centerTitle: false,
          title: AppTextStyles.autoTitleStyle(
              text: 'Bienvenido!',
              color: colorScheme.onBackground,
              height: height
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const ReminderCard(),
              BlocBuilder<PromedioBloc, PromedioState>(
                  bloc: promedioBloc,
                  builder: (context, state) {
                    if(state is AverageLoading){
                      return const Center(child: CircularProgressIndicator(),);
                    } else if (state is AverageListSuccess) {
                      return Column(
                        children: state.promedios.map((promedio) =>
                            AverageCard(
                                titulo: promedio.medicion,
                                porcentaje: promedio.calcularPorcentaje(),
                                promedio: promedio.promedio,
                                valorMinimo: promedio.valorMinimo.toInt(),
                                valorMaximo: promedio.valorMaximo.toInt(),
                                color: promedio.buscarColor()
                            )
                        ).toList(),
                      );
                    } else if (state is AverageError) {
                      return Center(child: Text(state.error));
                    } else {
                      return const Center(child: Text('Desconocido'),);
                    }
                  }
              )
            ],
          ),
          //floatingActionButton: const AddButton()
        ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}
