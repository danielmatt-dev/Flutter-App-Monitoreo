import 'package:app_plataforma/src/features/mediciones/presentation/cubit/medicion_cubit.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/pages/splash_test_screen.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/valor_request.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/pages/measurement_entry_screen.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// <>
class TemplateScreenMeasurement extends StatefulWidget {

  final TipoMedicion tipo;

  const TemplateScreenMeasurement({
    super.key,
    required this.tipo,
  });

  @override
  State<TemplateScreenMeasurement> createState() => _TemplateScreenMeasurementState();
}

class _TemplateScreenMeasurementState extends State<TemplateScreenMeasurement> {
  final medicionCubit = sl<MedicionCubit>();

  List<String> measurements = [];

  List<String> _getTitles(TipoMedicion tipo){
    final titles = [
      [
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
      [
        'Toma de presión arterial',
        'Paso 1',
        'Paso 2',
        'Recomendaciones',
        'Recomendaciones',
      ]
    ];

    return titles[tipo.index];
  }

  List<String> _getDescriptions(TipoMedicion tipo){
    final descriptions = [
      [
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
      [
        'Recomendaciones para obtener una lectura precisa de la presión arterial',
        'Usar monitores automáticos validados o, si no disponibles, aneroides calibrados',
        'Medir la presión arterial en un lugar tranquilo y libre de ruidos',
        'No conversar\nApoyar el brazo a la altura del corazón\nColocar el manguito en el brazo sin ropa\nUsar el tamaño de manguito adecuado',
        'Apoyar los pies\nNo cruzar las piernas\nTener la vejiga vacía\nApoyar la espalda',
      ]
    ];
    return descriptions[tipo.index];
  }

  List<IconData> _getIcons(TipoMedicion tipo){
    final icons = [
      [
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
      [
        Icons.monitor_heart_rounded,
        Icons.fact_check,
        Icons.noise_aware_rounded,
        Icons.recommend_rounded,
        Icons.wash_rounded,
      ]
    ];
    return icons[tipo.index];
  }

  Widget? _getScreen(TipoMedicion tipo) {

    if(measurements.isEmpty){
      return null;
    }

    return SafeArea(
      child: MeasurementEntryScreen(
        isGlucose: tipo == TipoMedicion.glucosa,
        measurements: measurements,
      ),
    );
  }

  void _handleMedicionState(TipoMedicion tipo) {
    medicionCubit.buscarMedicion(tipo);
  }

  @override
  Widget build(BuildContext context) {

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
              title: MessagesSnackbar.error,
              description: MessagesSnackbar.messageConnectionError,
              closed: false,
            );
          },
        );
      },
      child: SafeArea(
        child: SplashIconScreen(
          titles: _getTitles(widget.tipo),
          descriptions: _getDescriptions(widget.tipo),
          icons: _getIcons(widget.tipo),
          backgroundColor: colorScheme.onPrimary,
          foregroundColor: colorScheme.primary,
          nextScreen: _getScreen(widget.tipo),
          onPressed: (){
            _handleMedicionState(widget.tipo);
          },
        ),
      ),
    );
  }
}