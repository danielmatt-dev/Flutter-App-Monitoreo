import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/mediciones/presentation/cubit/medicion_cubit.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/valor_request.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/pages/measurement_entry_screen.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/widgets/template_screen_measurement.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertDialogCustom extends StatefulWidget {
  const AlertDialogCustom({super.key});

  @override
  State<AlertDialogCustom> createState() => _AlertDialogCustomState();
}

class _AlertDialogCustomState extends State<AlertDialogCustom> {
  late TipoMedicion tipo;

  final medicionCubit = sl<MedicionCubit>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

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
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: colorScheme.onPrimary,
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Container(
                        width: height * 0.1,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                          color: colorScheme.onPrimary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.question_mark_rounded,
                          size: height * 0.07,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              child: Column(
                children: [
                  AppTextStyles.autoBodyStyle(
                    text: 'Selecciona una medición',
                    color: colorScheme.primary,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ElevatedButton(
                            onPressed: () {
                              tipo = TipoMedicion.presion;
                              medicionCubit.buscarMedicion(TipoMedicion.presion);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Presión arterial',
                                style: TextStyle(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ElevatedButton(
                            onPressed: () {
                              tipo = TipoMedicion.glucosa;
                              medicionCubit.buscarMedicion(TipoMedicion.glucosa);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Glucosa',
                                style: TextStyle(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

