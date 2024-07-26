import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/ficha_medica/tratamiento_question.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/signup_screens.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/step_progress_widget.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/ficha_medica_section.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/cubit/preguntas_cubit.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/presentation/cubit/registro_respuestas_cubit.dart';
import 'package:app_plataforma/src/features/tratamiento/presentation/cubit/tratamiento_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainRegister extends StatefulWidget {
  const MainRegister({super.key});

  @override
  State<MainRegister> createState() => _MainRegisterState();
}

class _MainRegisterState extends State<MainRegister> {

  final PageController _pageController = PageController();
  int _currentPage = 0;

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPaternoController = TextEditingController();
  final TextEditingController _apellidoMaternoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final TextEditingController _nacimientoController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _numMiembrosController = TextEditingController();
  final TextEditingController _estadoCivilController = TextEditingController();
  final TextEditingController _estudiosController = TextEditingController();

  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _tallaController = TextEditingController();
  final TextEditingController _factorController = TextEditingController();

  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _tiempoController = TextEditingController();

  final TextEditingController _doctorController = TextEditingController();

  String? _tratamientoSelected;

  final preguntasCubit = sl<PreguntasCubit>();
  final tratamientoCubit = sl<TratamientoCubit>();

  final Map<int, RegistroRespuestas> _respuestas = {};
  List<Widget> screens = [];
  List<String> titles = [];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _registrarPaciente() {

    final pacienteBloc = sl<PacienteBloc>();

    pacienteBloc.add(
        CrearCuentaEvent(
            nombre: _nombreController.text,
            apellidoPaterno: _apellidoPaternoController.text,
            apellidoMaterno: _apellidoMaternoController.text,
            fechaNacimiento: _nacimientoController.text,
            genero: _generoController.text,
            estadoCivil: _estadoCivilController.text,
            nivelEstudios: _estudiosController.text,
            numMiembrosHogar: int.parse(_numMiembrosController.text),
            tipoDiabetes: _tipoController.text,
            tiempoDiabetes: _tiempoController.text,
            peso: double.parse(_pesoController.text),
            talla: double.parse(_tallaController.text),
            telefono: _telefonoController.text,
            correo: _correoController.text,
            password: _passwordController.text,
            factorActividad: _factorController.text,
            claveDoctor: _doctorController.text,
            nombreTratamiento: _tratamientoSelected!
        )
    );
  }

  void _registrarRespuestas(){

    final registroBloc = sl<RegistroRespuestasCubit>();
    registroBloc.guardarListaRespuestas(_respuestas);

  }

  void _guardarRespuesta(int idPregunta, RegistroRespuestas respuesta) {
    setState(() {
      _respuestas[idPregunta] = respuesta;
    });
  }

  @override
  void initState() {

    preguntasCubit.buscarPreguntasTipo(TipoPregunta.somatometria);

    tratamientoCubit.buscarListaTratamientos();

    titles = [
      'Usuario',
      'Ficha Técnica',
      'Somatometría',
      'Pregunta 1',
      'Pregunta 2',
      'Ficha Médica',
      'Tratamiento'
    ];

    screens = [
      UserAndContactScreen(
          nombreController: _nombreController,
          apellidoPaternoController: _apellidoPaternoController,
          apellidoMaternoController: _apellidoMaternoController,
          telefonoController: _telefonoController,
          correoController: _correoController,
          passwordController: _passwordController,
          confirmPasswordController: _confirmPasswordController
      ),
      DataSheetScreen(
          nacimientoController: _nacimientoController,
          generoController: _generoController,
          numMiembrosController: _numMiembrosController,
          estadoCivilController: _estadoCivilController,
          estudiosController: _estudiosController
      ),
      SomatometriaScreen(
          pesoController: _pesoController,
          tallaController: _tallaController,
          factorController: _factorController
      ),
      BlocBuilder<PreguntasCubit, PreguntaState>(
        bloc: preguntasCubit,
        builder: (context, state) {
          return state.map(
            initial: (_) => const Center(child: Text('Inicie el test')),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            listSuccess: (state) {
              final pregunta1 = state.preguntas[0];
              return SensacionQuestion(
                question: pregunta1.pregunta,
                additionalOptions: pregunta1.respuestas
                    .where((respuesta) => respuesta.descripcion != 'Si' && respuesta.descripcion != 'No')
                    .map((respuesta) => respuesta.descripcion).toList(),
                onOptionSelected: (String value) {
                  _guardarRespuesta(
                    pregunta1.idPregunta,
                    RegistroRespuestas(
                        idPregunta: pregunta1.idPregunta,
                        descripcionPregunta: pregunta1.pregunta,
                        tipo: 'somatometria',
                        respuesta: value,
                        puntaje: 0
                    )
                  );
                },
                onAdditionalOptionSelected: (String value) {

                  if(value != 'No') {
                    _guardarRespuesta(
                        pregunta1.idPregunta,
                        RegistroRespuestas(
                            idPregunta: pregunta1.idPregunta,
                            descripcionPregunta: pregunta1.pregunta,
                            tipo: 'somatometria',
                            respuesta: 'Sí: $value',
                            puntaje: 0
                        )
                    );
                  }
                },
              );
            },
            error: (state) => Center(child: Text('Error: ${state.message}')),
          );
        },
      ),
      BlocBuilder<PreguntasCubit, PreguntaState>(
        bloc: preguntasCubit,
        builder: (context, state) {
          return state.map(
            initial: (_) => const Center(child: Text('Inicie el test')),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            listSuccess: (state) {
              final pregunta2 = state.preguntas[1];
              return TemplateQuestion(
                question: pregunta2.pregunta,
                answers: pregunta2.respuestas.map((r) => r.descripcion).toList(),
                selectedResponse: _respuestas[pregunta2.idPregunta]?.respuesta,
                onSelectedResponse: (respuestaIndex) {
                  if (respuestaIndex < pregunta2.respuestas.length) {
                    _guardarRespuesta(
                      pregunta2.idPregunta,
                      RegistroRespuestas(
                        idPregunta: pregunta2.idPregunta,
                        descripcionPregunta: pregunta2.pregunta,
                        respuesta: pregunta2.respuestas[respuestaIndex].descripcion,
                        puntaje: pregunta2.respuestas[respuestaIndex].puntaje,
                        tipo: 'somatometria',
                      ),
                    );
                  }
                },
              );
            },
            error: (state) => Center(child: Text('Error: ${state.message}')),
          );
        },
      ),
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FichaMedicaSection(
          tiempoController: _tiempoController,
          tipoController: _tipoController,
        ),
      ),
      BlocBuilder<TratamientoCubit, TratamientoState>(
        builder: (context, state) {
          if (state is TratamientoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TratamientoSuccess) {
            return TratamientoQuestion(
              question: 'Seleccione su tratamiento',
              tratamientos: {'Oral': state.orales, 'Insulina' : state.insulina},
              onChanged: (value) {
                setState(() {
                  _tratamientoSelected = value;
                });
              },
              selectedResponse: _tratamientoSelected
            );
          } else {
            return const Center(child: Text('Error al cargar los tratamientos'));
          }
        },
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    final background = Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.black38;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StepProgressWidget(
              currentStep: _currentPage,
              totalSteps: screens.length - 1,
              titles: titles,
              background: colorScheme.surface,
            ),
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: screens.length,
                  itemBuilder: (context, index) {
                    return screens[index];
                  }
              )
            ),
          ],
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
                      duration: const Duration(milliseconds: 300), curve: Curves.ease
                  );
                }
                    : null,
                icon: Icon(
                  Icons.arrow_back,
                  color: colorScheme.secondary,
                ),
                label: AppTextStyles.autoBodyStyle(
                  text: 'ANTERIOR',
                  color: colorScheme.secondary,
                  height: height,
                  percent: 0.02,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: background,
                  side: BorderSide(color: colorScheme.secondary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (_currentPage != titles.length - 1)
                ElevatedButton.icon(
                  onPressed: () {
                    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                  },
                  icon: AppTextStyles.autoBodyStyle(
                    text: 'SIGUIENTE',
                    color: colorScheme.background,
                    height: height,
                    percent: 0.02,
                  ),
                  label: Icon(Icons.arrow_forward, color: background),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )
              else
                ElevatedButton(
                  onPressed: () {

                    // _registrarPaciente

                    print('Nombre: ${_nombreController.text}');
                    print('Apellido Paterno: ${_apellidoPaternoController.text}');
                    print('Apellido Materno: ${_apellidoMaternoController.text}');
                    print('Teléfono: ${_telefonoController.text}');
                    print('Correo: ${_correoController.text}');
                    print('Password: ${_passwordController.text}');
                    print('Confirm Password: ${_confirmPasswordController.text}');
                    print('Fecha de Nacimiento: ${_nacimientoController.text}');
                    print('Género: ${_generoController.text}');
                    print('Miembros del Hogar: ${_numMiembrosController.text}');
                    print('Estado Civil: ${_estadoCivilController.text}');
                    print('Estudios: ${_estudiosController.text}');
                    print('Peso: ${_pesoController.text}');
                    print('Talla: ${_tallaController.text}');
                    print(_respuestas);
                    print('Factor de Actividad: ${_factorController.text}');
                    print('Tipo de Diabetes: ${_tipoController.text}');
                    print('Tiempo con Diabetes: ${_tiempoController.text}');

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
