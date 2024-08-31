import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/mediciones/presentation/cubit/medicion_cubit.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/pages/splash_test_screen.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/pages/measurement_entry_screen.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({super.key});

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  final medicionCubit = sl<MedicionCubit>();
  List<String> measurements = [];

  final _tabs = [
    const Tab(text: 'Glucosa'),
    const Tab(text: 'Presión arterial'),
  ];

  void _handleMedicionState(String medicion) {
    medicionCubit.buscarMedicion(medicion);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<MedicionCubit, MedicionState>(
      bloc: medicionCubit,
      listener: (context, state) {
        state.map(
          initial: (_) {},
          listSuccess: (mediciones) {
            setState(() {
              measurements = mediciones.mediciones;
            });
          },
          emptyList: (_) {
            CustomSnackbar.show(
              context: context,
              typeMessage: TypeMessage.info,
              title: 'Mediciones disponibles',
              description: 'No hay mediciones pendientes para hoy',
            );
          },
          error: (_) {
            CustomSnackbar.show(
              context: context,
              typeMessage: TypeMessage.error,
              title: 'Error',
              description: 'Vuelva a intentarlo más tarde',
              closed: false,
            );
          },
        );
      },
      child: SafeArea(
        child: DefaultTabController(
          length: _tabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: AppTextStyles.autoBodyStyle(
                text: 'Instrucciones',
                color: colorScheme.primary,
                height: height,
                percent: 0.03,
              ),
              centerTitle: true,
              bottom: TabBar(
                tabs: _tabs,
                dividerColor: colorScheme.onBackground.withOpacity(0.2),
              ),
            ),
            body: TabBarView(
              children: [
                SplashIconScreen(
                  titles: const [
                    'Toma de glucosa',
                    'Recomendaciones',
                    'Paso 1',
                    'Paso 2',
                    'Paso 3',
                    'Paso 4',
                    'Paso 5',
                    'Paso 6',
                    'Paso 7',
                  ],
                  descriptions: const [
                    'Hay diferentes tipos de medidores (glucometros), pero la mayoría de ellos funcionan de la misma manera.',
                    'A continuación, se exponen una serie de recomendaciones acerca de cómo usar un medidor del nivel de azúcar en la sangre',
                    'Asegúrese de que el medidor esté limpio y listo para usarse',
                    'Después de sacar una tira de prueba (reactiva) de inmediato cierre bien el recipiente. Las tiras de prueba se pueden dañar si se exponen a la humedad',
                    'Lávese las manos con agua tibia y jabón. Séquelas bien. Masajéese la mano para que la sangre fluya a su dedo. No use alcohol porque seca mucho la piel,',
                    'Use una lanceta para pincharse el dedo. Presionando desde la base del dedo, ponga suavemente una pequeña cantidad de sangre sobre la tira reactiva. Ponga la tira en el medidor de glucosa',
                    'Después de unos segundos aparecerá el valor. Anote y haga seguimiento a sus resultados. Agregue notas sobre cualquier cosa que pueda haber hecho que los números no estén dentro de su rango objetivo, como alimentos, actividad, etc',
                    'Deseche la lanceta y la tira adecuadamente en un recipiente de basura',
                    'Guarde las tiras de prueba en el recipiente suministrado. No las exponga a humedad, calor extremo ni temperaturas frías',
                  ],
                  icons: const [
                    Icons.medical_services_rounded,
                    Icons.fact_check,
                    Icons.check_circle_rounded,
                    Icons.water_damage_rounded,
                    Icons.wash_rounded,
                    Icons.bloodtype_rounded,
                    Icons.note_add_rounded,
                    Icons.delete_rounded,
                    Icons.thermostat_rounded,
                  ],
                  backgroundColor: colorScheme.onPrimary,
                  foregroundColor: colorScheme.primary,
                  nextScreen: measurements.isNotEmpty
                      ? SafeArea(
                        child: MeasurementEntryScreen(
                          isGlucose: true,
                          measurements: measurements,
                        ),
                      )
                      : null,
                  onPressed: () {
                    _handleMedicionState('glucosa');
                  },
                ),
                SplashIconScreen(
                  titles: const [
                    'Toma de presión arterial',
                    'Paso 1',
                    'Paso 2',
                    'Recomendaciones',
                    'Recomendaciones',
                  ],
                  descriptions: const [
                    'Recomendaciones para obtener una lectura precisa de la presión arterial',
                    'Usar monitores automáticos validados o, si no disponibles, aneroides calibrados',
                    'Medir la presión arterial en un lugar tranquilo y libre de ruidos',
                    'No conversar\nApoyar el brazo a la altura del corazón\nColocar el manguito en el brazo sin ropa\nUsar el tamaño de manguito adecuado',
                    'Apoyar los pies\nNo cruzar las piernas\nTener la vejiga vacía\nApoyar la espalda',
                  ],
                  icons: const [
                    Icons.monitor_heart_rounded,
                    Icons.fact_check,
                    Icons.noise_aware_rounded,
                    Icons.recommend_rounded,
                    Icons.wash_rounded,
                  ],
                  backgroundColor: colorScheme.onPrimary,
                  foregroundColor: colorScheme.primary,
                  nextScreen: measurements.isNotEmpty
                      ? SafeArea(
                        child: MeasurementEntryScreen(
                          isGlucose: false,
                          measurements: measurements,
                        ),
                      )
                      : null,
                  onPressed: () {
                    _handleMedicionState('presion');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}