import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/cubit/preguntas_cubit.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/test_profile_widget.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/presentation/cubit/registro_respuestas_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreguntaScreen extends StatelessWidget {

  const PreguntaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreguntasCubit, PreguntaState>(
        bloc: sl<PreguntasCubit>()..preguntasCargadas(),
        builder: (context, state) {
          return state.map(
            initial: (_) => const Center(child: Text('Inicie el test')),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            listSuccess: (state) => PreguntaView(preguntas: state.preguntas),
            error: (state) => Center(child: Text('Error: ${state.message}')),
          );
        }
    );
  }

}

class PreguntaView extends StatefulWidget {
  final List<Pregunta> preguntas;

  const PreguntaView({super.key, required this.preguntas});

  @override
  State<PreguntaView> createState() => _PreguntaViewState();
}

// <>
class _PreguntaViewState extends State<PreguntaView> {

  final respuestaBloc = sl<RegistroRespuestasCubit>();
  final PageController _pageController = PageController();
  final Map<int, RegistroRespuestas> _respuestas = {};
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {

    final totalPages = widget.preguntas.length;
    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const AppBarCustom(
        title: 'Test',
        center: true,
      ),
      body: BlocListener<RegistroRespuestasCubit, RegistroRespuestasState>(
        listener: (context, state) {
          if (state is RegistroRespuestasSaveSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Respuestas guardadas con éxito!')),
            );
          } else if (state is RegistroRespuestasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.error}')),
            );
          }
        },
        child: BlocBuilder<RegistroRespuestasCubit, RegistroRespuestasState>(
          builder: (context, state){
            return Column(
                children: [
                  AppTextStyles.autoBodyStyle(
                      text: 'Pregunta ${_currentPage+1}/$totalPages',
                      color: colorScheme.secondary,
                      height: height,
                      percent: 0.025,
                      vertical: 10
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: LinearProgressIndicator(
                      value: (_currentPage + 1) / totalPages,
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.preguntas.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final pregunta = widget.preguntas[index];
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TestProfileWidget(
                            question: pregunta.pregunta,
                            answers: pregunta.respuestas,
                            onSelectedResponse: (respuestaIndex) {
                              if (respuestaIndex < pregunta.respuestas.length) {
                                setState(() {
                                  _respuestas[pregunta.idPregunta] = RegistroRespuestas(
                                    idPregunta: pregunta.idPregunta,
                                    descripcionPregunta: pregunta.pregunta,
                                    respuesta: pregunta.respuestas[respuestaIndex].descripcion,
                                    puntaje: pregunta.respuestas[respuestaIndex].puntaje,
                                    tipo: 'Test',
                                  );
                                });
                              }
                            },
                            selectedResponse: _respuestas[pregunta.idPregunta]?.respuesta,
                          ),
                        );
                      },
                    ),
                  ),
                ]
            );
          }
        ),
      ),
      bottomNavigationBar: Container(
        color: colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: _currentPage != 0
                    ? () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  }
                  : null,
                icon: Icon(
                    Icons.arrow_back,
                    color: colorScheme.secondary
                ),
                label: AppTextStyles.autoBodyStyle(
                    text: 'ANTERIOR',
                  color: colorScheme.secondary,
                  height: height,
                  percent: 0.02,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.background,
                  side: BorderSide(color: colorScheme.secondary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (_currentPage != widget.preguntas.length - 1)
                ElevatedButton.icon(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: AppTextStyles.autoBodyStyle(
                      text: 'SIGUIENTE',
                      color: colorScheme.background,
                      height: height,
                      percent: 0.02
                  ),
                  label: Icon(Icons.arrow_forward, color: colorScheme.background),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              if (_currentPage == widget.preguntas.length - 1)
                ElevatedButton(
                  onPressed: () {
                    if(_respuestas.length != totalPages){

                      for (int i = 0; i < widget.preguntas.length; i++) {
                        if (!_respuestas.containsKey(widget.preguntas[i].idPregunta)) {
                          _pageController.jumpToPage(i);
                          break;
                        }
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Debe responder todas las preguntas'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    if(_respuestas.length == totalPages) {
                      respuestaBloc.guardarListaRespuestas(_respuestas);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: AppTextStyles.autoBodyStyle(
                    text: 'GUARDAR',
                    color: colorScheme.background,
                    height: height,
                    percent: 0.02,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
