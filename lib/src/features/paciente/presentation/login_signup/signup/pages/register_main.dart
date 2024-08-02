import 'package:app_plataforma/src/features/doctor/presentation/pages/clave_doctor_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/cubit/auth_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/ficha_medica/tratamiento_question.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/signup_screens.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/custom_bottom_navigation_bar.dart';
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
  String? _visionSelected;
  TextEditingController _sensacionOtroController = TextEditingController();

  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _tiempoController = TextEditingController();

  final TextEditingController _doctorController = TextEditingController();

  String? _tratamientoSelected;

  final authCubit = sl<AuthCubit>();
  final pacienteBloc = sl<PacienteBloc>();
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

  void showSnackBar(String message) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  }

  bool validateDataSheetScreen(BuildContext context) {

    bool esMayorDeEdad(String fecha){
      DateTime fechaNacimiento = DateTime.parse(fecha);
      DateTime fechaActual = DateTime.now();
      int edad = fechaActual.year - fechaNacimiento.year;

      if (fechaActual.month < fechaNacimiento.month || (fechaActual.month == fechaNacimiento.month && fechaActual.day < fechaNacimiento.day)) {
        edad--;
      }

      return edad >= 18;
    }

    if (_estadoCivilController.text.isEmpty) {
      showSnackBar('El estado civil no es válido');
      return false;
    }

    if (_estudiosController.text.isEmpty) {
      showSnackBar('El nivel de estudios no es válido');
      return false;
    }

    if (_nacimientoController.text.isEmpty) {
      showSnackBar('La fecha de nacimiento no es válida');
      return false;
    } else if (!esMayorDeEdad(_nacimientoController.text)) {
      showSnackBar('Debe ser mayor de edad');
      return false;
    }

    return true;
  }

  bool validateSomatometriaScreen(BuildContext context) {

    if(_factorController.text.isEmpty){
      showSnackBar('Factor de actividad no válido');
      return false;
    }
    return true;
  }

  bool validateSensacionQuestionScreen(BuildContext context) {

    print(_sensacionSelected);

    print('Selected: $_sensacionSelected');
    print('Otro: ${_sensacionOtroController.text}');

    if(_sensacionSelected == null && _sensacionOtroController.text.isEmpty){
      showSnackBar('Selecciona una respuesta');
      return false;
    }

    return true;
  }

  bool validateVisionQuestionScreen(BuildContext context) {

    if(_visionSelected == null){
      showSnackBar('Selecciona una visión');
      return false;
    }

    return true;
  }

  bool validateFichaMedicaScreen(BuildContext context) {

    if(_tipoController.text.isEmpty){
      showSnackBar('Tipo de diabetes no válido');
      return false;
    }

    if(_tiempoController.text.isEmpty){
      showSnackBar('Tiempo con diabetes no válido');
      return false;
    }

    return true;
  }

  bool validateTratamientoScreen(BuildContext context) {

    if(_tratamientoSelected == null){
      showSnackBar('Tratamiento no válido');
      return false;
    }

    return true;
  }

  bool validateDoctorScreen(BuildContext context) {

    if(_doctorController.text.isEmpty){
      showSnackBar('Doctor no ingresado');
      return false;
    }

    return true;
  }

  void _registrarPaciente() {

    authCubit.signupPaciente(
        _nombreController.text,
        _apellidoPaternoController.text,
        _apellidoMaternoController.text,
        _nacimientoController.text,
        _generoController.text,
        mapEstado.entries.firstWhere(
                (entry) => entry.value == _estadoCivilController.text,
            orElse: () => const MapEntry('', '') )
            .key,
        _estudiosController.text,
        int.parse(_numMiembrosController.text),
        _tipoController.text,
        _tiempoController.text,
        double.parse(_pesoController.text),
        double.parse(_tallaController.text),
        _correoController.text,
        _telefonoController.text,
        _passwordController.text,
        _factorController.text,
        _doctorController.text,
        _tratamientoSelected!
    );

  }

  void _registrarRespuestas(){

    final registroBloc = sl<RegistroRespuestasCubit>();
    registroBloc.guardarListaRespuestas(_respuestas);

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

    _nacimientoController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());

    preguntasCubit.buscarPreguntasTipo(TipoPregunta.somatometria);

    tratamientoCubit.buscarListaTratamientos();

    titles = [
      'Usuario',
      'Ficha Técnica',
      'Somatometría',
      'Pregunta 1',
      'Pregunta 2',
      'Ficha Médica',
      'Tratamiento',
      'Doctor'
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
            return TratamientoQuestion(
              question: 'Seleccione su tratamiento',
              tratamientos: {'Oral': state.orales, 'Insulina': state.insulina},
              onChanged: (value) {
                setState(() {
                  _tratamientoSelected = value ?? '';
                });
              },
              selectedResponse: _tratamientoSelected,
            );
          } else {
            return const Center(child: Text('Error al cargar los tratamientos'));
          }
        },
      ),
      DoctorScreen(doctorController: _doctorController,),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

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
          (context) => false,
              (context) => validateDataSheetScreen(context), 
              (context) => validateSomatometriaScreen(context), 
              (context) => validateSensacionQuestionScreen(context), 
              (context) => validateVisionQuestionScreen(context),
              (context) => validateFichaMedicaScreen(context),
              (context) => validateTratamientoScreen(context),
              (context) => validateDoctorScreen(context),
        ],
        onSave: () {
          _registrarPaciente();
          _registrarRespuestas();
          },
      ),
    );

  }
}
