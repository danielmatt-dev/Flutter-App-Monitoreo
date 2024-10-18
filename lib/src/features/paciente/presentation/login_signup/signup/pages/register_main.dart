import 'package:app_plataforma/src/core/theme/cubit/theme_cubit.dart';
import 'package:app_plataforma/src/features/doctor/presentation/pages/clave_doctor_screen.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/cubit/auth_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/ficha_medica/tratamiento_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/signup_screens.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/validations_register_main.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/custom_bottom_navigation_bar.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/step_progress_widget.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/ficha_medica_section.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/cubit/preguntas_cubit.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/pages/splash_test_screen.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/pages/terminos_condiciones_screen.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/pages/test_screen.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/presentation/cubit/registro_respuestas_cubit.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento_paciente.dart';
import 'package:app_plataforma/src/features/tratamiento/presentation/cubit/tratamiento_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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

  String? _sensacionSelected;
  final TextEditingController _sensacionOtroController = TextEditingController();
  String? _visionSelected;

  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _tiempoController = TextEditingController();

  final TextEditingController _doctorController = TextEditingController();

  final authCubit = sl<AuthCubit>();
  final themeCubit = sl<ThemeCubit>();
  final pacienteBloc = sl<PacienteBloc>();
  final preguntasCubit = sl<PreguntasCubit>();
  final tratamientoCubit = sl<TratamientoCubit>();
  final registroBloc = sl<RegistroRespuestasCubit>();

  List<Tratamiento> _tratamientosSeleccionados = [];
  bool _isNingunTratamientoSelected = false;
  final Map<int, RegistroRespuestas> _respuestas = {};

  List<Widget> screens = [];
  List<String> titles = [];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void showSnackBar({String title = 'Campo necesario', required String message}) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      CustomSnackbar.show(
          context: context,
          typeMessage: TypeMessage.warning,
          title: title,
          description: message
      );
    });
  }

  void _registrarPaciente() {

    authCubit.signupPaciente(
      PacienteRequest(
          nombre: _nombreController.text,
          apellidoPaterno: _apellidoPaternoController.text,
          apellidoMaterno: _apellidoMaternoController.text,
          fechaNacimiento: _nacimientoController.text,
          genero: _generoController.text,
          estadoCivil: mapEstado.entries.firstWhere(
                  (entry) => entry.value == _estadoCivilController.text,
              orElse: () => const MapEntry('', '') )
              .key,
          nivelEstudios: _estudiosController.text,
          numMiembrosHogar: int.parse(_numMiembrosController.text),
          tipoDiabetes: _tipoController.text,
          tiempoDiabetes: _tiempoController.text,
          peso: double.parse(_pesoController.text),
          talla: double.parse(_tallaController.text),
          correo: _correoController.text,
          telefono: _telefonoController.text,
          password: _passwordController.text,
          factorActividad: _factorController.text,
          claveDoctor: _doctorController.text,
      ),
      TratamientoPaciente(tratamientos: _tratamientosSeleccionados),
      _respuestas
    );

  }

  void _guardarRespuesta(RegistroRespuestas respuesta) {
    setState(() {
      _respuestas[respuesta.idPregunta] = respuesta;
    });
  }

  @override
  void initState() {

    /*  Valores por defecto  */
    _numMiembrosController.text = '1';
    _generoController.text = 'Hombre';

    _pesoController.text = '50.0';
    _tallaController.text = '150';

    _nacimientoController.text = DateFormat('yyyy-MM-dd').format(
        DateTime(
            DateTime.now().year - 18,
            DateTime.now().month,
            DateTime.now().day
        ));

    preguntasCubit.buscarPreguntasTipo(TipoPregunta.somatometria);

    tratamientoCubit.buscarListaTratamientos();

    titles = [
      'Usuario',
      'Ficha Técnica',
      'Somatometría',
      'Sensación Corporal',
      'Evaluación Visual',
      'Ficha Médica',
      'Tratamiento',
      'Doctor',
      'Términos',
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
                  _sensacionSelected = value;
                  _guardarRespuesta(
                    RegistroRespuestas(
                      idPregunta: pregunta1.idPregunta,
                      descripcionPregunta: pregunta1.pregunta,
                      tipo: 'somatometria',
                      respuesta: value,
                      puntaje: 0,
                    ),
                  );
                },
                onAdditionalOptionSelected: (String value) {
                  if (value != 'No') {
                    _sensacionSelected = value;
                    _guardarRespuesta(
                      RegistroRespuestas(
                        idPregunta: pregunta1.idPregunta,
                        descripcionPregunta: pregunta1.pregunta,
                        tipo: 'somatometria',
                        respuesta: 'Sí: $value',
                        puntaje: 0,
                      ),
                    );
                  }
                },
                otroController: _sensacionOtroController,
                onChanged: (value) {
                  _sensacionSelected = null;
                  if (value.length <= 30) {
                    _guardarRespuesta(
                      RegistroRespuestas(
                        idPregunta: pregunta1.idPregunta,
                        descripcionPregunta: pregunta1.pregunta,
                        tipo: 'somatometria',
                        respuesta: 'Sí: $value',
                        puntaje: 0,
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
                    _visionSelected = pregunta2.respuestas[respuestaIndex].descripcion;
                    _guardarRespuesta(
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
            return TratamientoScreen(
              question: 'Seleccione su tratamiento',
              tratamientos: {'Oral': state.orales, 'Insulina': state.insulina},
              selectedResponses: _tratamientosSeleccionados,
              selectedNinguna: _isNingunTratamientoSelected,
              onChanged: (selection) {
                setState(() {
                  _tratamientosSeleccionados = selection.tratamientosSeleccionados;
                  _isNingunTratamientoSelected = selection.ningunaSeleccionada;
                });
              },
            );
          } else {
            CustomSnackbar.show(
                context: context,
                typeMessage: TypeMessage.error,
                title: MessagesSnackbar.error,
                description: MessagesSnackbar.messageConnectionError
            );
            return const SizedBox.shrink();
          }
        },
      ),
      DoctorScreen(doctorController: _doctorController,),
      const TerminosCondicionesBody(withDeclaracion: true,)
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final validations = ValidationsRegisterMain(context: context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is SignUpAuthSuccess) {
              CustomSnackbar.show(
                context: context,
                typeMessage: TypeMessage.success,
                title: MessagesSnackbar.signUpSuccess,
                description: MessagesSnackbar.messageSignUpSuccess,
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? colorScheme.surface
                    : colorScheme.secondary
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const SplashIconScreen(
                      titles: ['Objetivo', 'Confidencialidad',],
                      descriptions: [
                        'Identificar los aspectos relacionados con el autocuidado de la diabetes para poder ofrecer alternativas para su mejora',
                        'Tenga la confianza de responder con sinceridad todas las preguntas para identificar más claramente sus necesidades',
                      ],
                      icons: [
                        Icons.fact_check_rounded,
                        Icons.health_and_safety_rounded,
                      ],
                      nextScreen: TestScreen(),
                      foregroundColor: Colors.white,
                      withSkip: false,
                    )),
              );
            }
          },
          child: Column(
            children: [
              StepProgressWidget(
                currentStep: _currentPage,
                totalSteps: screens.length - 1,
                titles: titles,
                background: colorScheme.surface,
                lastText: 'Registrar paciente',
              ),
              Expanded(
                child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
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
        bottomNavigationBar: CustomBottomNavigationBar(
          length: screens.length,
          currentPage: _currentPage,
          pageController: _pageController,
          validations: [
            (context) => validations.validateUserAndContactScreen(
                correo: _correoController.text,
                contrasenia: _passwordController.text,
                confirmarContrasenia: _confirmPasswordController.text,
                nombre: _nombreController.text,
                apellidoPaterno: _apellidoPaternoController.text,
                apellidoMaterno: _apellidoMaternoController.text,
                telefono: _telefonoController.text
            ),
                (context) => validations.validateDataSheetScreen(
                    estadoCivil: _estadoCivilController.text,
                    estudios: _estudiosController.text,
                    fechaNacimiento: _nacimientoController.text
                ),
                (context) => validations.validateSomatometriaScreen(
                    factorActividad: _factorController.text
                ),
                (context) => validations.validateSensacionQuestionScreen(
                    sensacionSelected: _sensacionSelected,
                    sensacionOtro: _sensacionOtroController.text
                ),
                (context) => validations.validateVisionQuestionScreen(
                    visionSelected: _visionSelected
                ),
                (context) => validations.validateFichaMedicaScreen(
                    tipoDiabetes: _tipoController.text,
                    tiempoConDiabetes: _tiempoController.text
                ),
                (context) => validations.validateTratamientoScreen(
                    tratamientosSeleccionados: _tratamientosSeleccionados,
                    isNingunTratamientoSelected: _isNingunTratamientoSelected
                ),
                (context) => validations.validateDoctorScreen(
                    claveDoctor: _doctorController.text
                ),
                (context) => true,
          ],
          onSave: () {
            _registrarPaciente();
            },
        ),
      ),
    );

  }

}
