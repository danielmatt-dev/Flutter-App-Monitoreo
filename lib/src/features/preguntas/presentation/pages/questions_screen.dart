import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/widgets/card_recommendation.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/cubit/preguntas_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsScreen extends StatefulWidget {

  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  final preguntaCubit = sl<PreguntasCubit>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        appBar: const AppBarCustom(
          title: 'Preguntas frecuentes',
          center: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<PreguntasCubit, PreguntaState>(
            bloc: preguntaCubit..buscarPreguntasTipo(TipoPregunta.duda),
            builder: (context, state) {
              return state.map(
                initial: (_) => const Center(child: Text('Inicie el test')),
                loading: (_) => const Scaffold(body: Center(child: CircularProgressIndicator())),
                listSuccess: (state) {
                  return Column(
                    children: state.preguntas.map((pregunta) {
                      return CardRecommendation(
                          title: pregunta.pregunta,
                          description: pregunta.respuestas[0].descripcion,
                          type: 'Duda'
                      );
                    }).toList()
                  );
                },
                error: (state) => Center(child: Text('Error: ${state.message}')),
              );
              },
          ),
        ),
      ),
    );
  }
}