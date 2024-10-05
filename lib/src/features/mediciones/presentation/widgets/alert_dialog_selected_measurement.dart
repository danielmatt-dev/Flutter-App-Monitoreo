import 'package:app_plataforma/src/features/mediciones/presentation/cubit/medicion_cubit.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/valor_request.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/pages/measurement_entry_screen.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/alert_dialog_custom.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertDialogSelectedMeasurement extends StatefulWidget {
  const AlertDialogSelectedMeasurement({super.key});

  @override
  State<AlertDialogSelectedMeasurement> createState() => _AlertDialogSelectedMeasurementState();
}

class _AlertDialogSelectedMeasurementState extends State<AlertDialogSelectedMeasurement> {
  late TipoMedicion tipo;

  final medicionCubit = sl<MedicionCubit>();

  @override
  Widget build(BuildContext context) {

    return BlocListener<MedicionCubit, MedicionState>(
      bloc: medicionCubit,
      listener: (context, state) {
        state.map(
          initial: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          listSuccess: (mediciones) {
            // Navegamos solo si estamos en el contexto adecuado
            if (context.mounted) {
              Navigator.of(context).pop();  // Cerramos el AlertDialog
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SafeArea(
                    child: MeasurementEntryScreen(
                      isGlucose: tipo == TipoMedicion.glucosa,
                      measurements: mediciones.mediciones,
                    ),
                  ),
                ),
              );
            }
          },
          emptyList: (_) {
            // Cerramos el AlertDialog y mostramos Snackbar si no hay mediciones
            if (context.mounted) {
              Navigator.of(context).pop();
              CustomSnackbar.show(
                context: context,
                typeMessage: TypeMessage.info,
                title: 'Mediciones disponibles',
                description: 'No hay mediciones pendientes para hoy',
                closed: false,
              );
            }
          },
          error: (errorState) {
            // Cerramos el AlertDialog y mostramos Snackbar si ocurre un error
            if (context.mounted) {
              Navigator.of(context).pop();
              CustomSnackbar.show(
                context: context,
                typeMessage: TypeMessage.error,
                title: MessagesSnackbar.error,
                description: MessagesSnackbar.messageConnectionError,
                closed: false,
              );
            }
          },
        );
      },
      child: AlertDialogCustom(
        title: 'Selecciona una medición',
        optionOne: 'Presión arterial',
        optionTwo: 'Glucosa',
        onFirstPressed: () {
          tipo = TipoMedicion.presion;
          medicionCubit.buscarMedicion(TipoMedicion.presion);
        },
        onSecondPressed: () {
          tipo = TipoMedicion.glucosa;
          medicionCubit.buscarMedicion(TipoMedicion.glucosa);
        },
      ),
    );
  }
}

