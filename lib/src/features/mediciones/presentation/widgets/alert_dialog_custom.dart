import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/mediciones/presentation/cubit/medicion_cubit.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/pages/measurement_entry_screen.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertDialogCustom extends StatefulWidget {

  const AlertDialogCustom({super.key,});

  @override
  State<AlertDialogCustom> createState() => _AlertDialogCustomState();
}

class _AlertDialogCustomState extends State<AlertDialogCustom> {

  String _medicion = '';

  final medicionCubit = sl<MedicionCubit>();

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return BlocListener<MedicionCubit, MedicionState>(
      bloc: medicionCubit,
      listener: (context, state) {
        state.map(
          initial: (_) => const Center(child: CircularProgressIndicator(),),
          listSuccess: (mediciones) {
            Navigator.of(context).pop();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: true,
                builder: (context) =>
                    FractionallySizedBox(
                      heightFactor: 0.97,
                      child: SafeArea(
                        child: MeasurementEntryScreen(
                          isGlucose: _medicion == 'glucosa',
                          measurements: mediciones.mediciones,
                        ),
                      ),
                    ),
              );
            });
          },
          emptyList: (_) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            });
            SchedulerBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                CustomSnackbar.show(
                  context: context,
                  typeMessage: TypeMessage.info,
                  title: 'Mediciones disponibles',
                  description: 'No hay mediciones pendientes para hoy',
                  closed: false
                );
              }
            });
          },
          error: (errorState) {
            Navigator.of(context).pop();
            SchedulerBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                CustomSnackbar.show(
                    context: context,
                    typeMessage: TypeMessage.error,
                    title: 'Error',
                    description: 'Vuelva a intentarlo más tarde',
                    closed: false
                );
              }
            });
          }
        );
      },
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: colorScheme.background,
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.onBackground,
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
                          color: colorScheme.background,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.question_mark_rounded,
                          size: height * 0.07,
                          color: colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.close, color: colorScheme.background),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              child: Column(
                children: [
                  Text(
                    'Selecciona una medición',
                    style: AppTextStyles.titleStyle(
                      color: colorScheme.onBackground,
                      size: height * 0.025,
                    ),
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
                              _medicion = 'presion';
                              medicionCubit.buscarMedicion('presion');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.onBackground,
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
                                  color: colorScheme.background,
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
                              _medicion = 'glucosa';
                              medicionCubit.buscarMedicion('glucosa');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.onBackground,
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
                                  color: colorScheme.background,
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
