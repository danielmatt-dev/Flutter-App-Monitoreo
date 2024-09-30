import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/cubit/preguntas_cubit.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/test_profile_widget.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/presentation/cubit/registro_respuestas_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestScreen extends StatelessWidget {

  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreguntasCubit, PreguntaState>(
        bloc: sl<PreguntasCubit>()..buscarPreguntasTipo(TipoPregunta.autocuidado),
        builder: (context, state) {
          return state.map(
            initial: (_) => const Center(child: Text('Inicie el test')),
            loading: (_) => const Scaffold(body: Center(child: CircularProgressIndicator())),
            listSuccess: (state) => TestView(preguntas: state.preguntas),
            error: (state) => Center(child: Text('Error: ${state.message}')),
          );
        }
    );
  }

}

class TestView extends StatefulWidget {

  final List<Pregunta> preguntas;
  final Color? foregroundColor;
  final Color? selectedColor;
  final Color? selectedTextColor;

  const TestView({
    super.key,
    required this.preguntas,
    this.foregroundColor,
    this.selectedColor,
    this.selectedTextColor
  });

  @override
  State<TestView> createState() => _TestViewState();
}

// <>
class _TestViewState extends State<TestView> {

  final respuestaBloc = sl<RegistroRespuestasCubit>();
  final PageController _pageController = PageController();
  final Map<int, RegistroRespuestas> _respuestas = {};
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {

    final totalPages = widget.preguntas.length;
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.onPrimary,
        appBar: const AppBarCustom(title: 'Cuestionario',),
        body: BlocListener<RegistroRespuestasCubit, RegistroRespuestasState>(
          listener: (context, state) {
            if (state is RegistroRespuestasSaveSuccess) {
              CustomSnackbar.show(
                context: context,
                typeMessage: TypeMessage.success,
                title: MessagesSnackbar.success,
                description: MessagesSnackbar.messageSaveSuccess,
              );
            } else if (state is RegistroRespuestasError) {
              CustomSnackbar.show(
                context: context,
                typeMessage: TypeMessage.error,
                title: MessagesSnackbar.error,
                description: MessagesSnackbar.messageConnectionError,
              );
            }
          },
          child: BlocBuilder<RegistroRespuestasCubit, RegistroRespuestasState>(
            builder: (context, state){
              return Column(
                  children: [
                    AppTextStyles.autoBodyStyle(
                        text: 'Pregunta ${_currentPage+1}/$totalPages',
                        color: widget.foregroundColor ?? colorScheme.secondary,
                        size: SizeIcon.size18,
                        vertical: 10
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: LinearProgressIndicator(
                        value: _respuestas.length / totalPages,
                        backgroundColor: Colors.grey.withOpacity(0.2),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
          color: colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationButton(
                  label: _currentPage == 0 ? 'VOLVER' : 'ANTERIOR',
                  icon: Icons.arrow_back,
                  onPressed: _currentPage != 0
                      ? () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                  : () {
                    Navigator.pop(context);
                    },
                  enabledColor: isDarkMode ? Colors.black12 : Colors.white,
                  textColor: colorScheme.secondary,
                ),
                if (_currentPage != widget.preguntas.length - 1)
                  NavigationButton(
                    label: 'SIGUIENTE',
                    icon: Icons.arrow_forward,
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    enabledColor: colorScheme.secondary,
                    disabledColor: const Color(0xFFD9D9D9),
                    textColor: colorScheme.onPrimary,
                    isNext: true,
                  ),
                if (_currentPage == widget.preguntas.length - 1)
                  NavigationButton(
                    label: 'GUARDAR',
                    icon: Icons.save_alt_rounded,
                    onPressed: () {
                      if(_respuestas.length != totalPages){

                        for (int i = 0; i < widget.preguntas.length; i++) {
                          if (!_respuestas.containsKey(widget.preguntas[i].idPregunta)) {
                            _pageController.jumpToPage(i);
                            break;
                          }
                        }
                        CustomSnackbar.show(
                          context:  context,
                          typeMessage: TypeMessage.error,
                          title: 'Cuestionario incompleto',
                          description: 'Debe responder todas las preguntas',
                        );
                      }
                      if(_respuestas.length == totalPages) {
                        respuestaBloc.guardarListaRespuestas(_respuestas);
                      }
                    },
                    enabledColor: Colors.green,
                    disabledColor: const Color(0xFFD9D9D9),
                    textColor: colorScheme.onPrimary,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
