import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/mediciones/presentation/widgets/alert_dialog_custom.dart';
import 'package:app_plataforma/src/features/valor/presentation/valor_response/bloc/valor_response_bloc.dart';
import 'package:app_plataforma/src/features/valor/presentation/valor_response/widgets/card_timeline.dart';
import 'package:app_plataforma/src/features/valor/presentation/valor_response/widgets/table_calendar.dart';
import 'package:app_plataforma/src/features/valor/presentation/valor_response/widgets/traffic_light.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// <>
class MonitoringScreen extends StatefulWidget {

  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();

}

class _MonitoringScreenState extends State<MonitoringScreen> with AutomaticKeepAliveClientMixin<MonitoringScreen> {

  final ValorResponseBloc valorResponseBloc = sl<ValorResponseBloc>();

  DateTime today = DateTime.now();
  DateTime? selectedDate;
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    _formattedDate();
    valorResponseBloc.add(GetListValores(fecha: formattedDate));
  }

  void _formattedDate() {
    formattedDate = selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(selectedDate!)
        : DateFormat('yyyy-MM-dd').format(today);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDate = selectedDay;
      today = focusedDay;
      _formattedDate();
      valorResponseBloc.add(GetListValores(fecha: formattedDate));
    });
  }

  void showCustomBottomSheet(BuildContext context, Widget Function(BuildContext) builder) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      context: context,
      builder: builder,
      useSafeArea: true
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    String formattedSelectedDate = selectedDate != null
        ? DateFormat('EEEE, d MMM', 'es_ES').format(selectedDate!)
        : DateFormat('EEEE, d MMM', 'es_ES').format(today);

    return BlocProvider<ValorResponseBloc>(
      create: (context) => valorResponseBloc,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.002),
            TableCalendarWidget(
              today: today,
              selectedDate: selectedDate,
              onDaySelected: _onDaySelected,
              selectedColor: isDarkMode ? colorScheme.surface : colorScheme.primary,
              todayColor: isDarkMode
                  ? colorScheme.surface.withOpacity(0.8)
                  : colorScheme.primary.withOpacity(0.6),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: AppTextStyles.autoBodyStyle(
                          text: formattedSelectedDate,
                          color: colorScheme.primary,
                          height: height,
                          percent: 0.022
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => const AlertDialogCustom()
                          );
                        },
                        icon: Icon(Icons.add, color: colorScheme.onPrimary),
                        label: AppTextStyles.autoBodyStyle(
                            text: 'Nueva medición',
                            color: colorScheme.onPrimary,
                            height: height,
                            percent: 0.022
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
            Divider(
                color: colorScheme.primary.withOpacity(0.2),
                indent: 10,
                endIndent: 10
            ),
            BlocBuilder<ValorResponseBloc, ValorResponseState>(
                builder: (context, state) {
                  if(state is ValorResponseLoading){
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ValorGetListSuccess){
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppTextStyles.autoBodyStyle(
                                    text: 'Glucosa',
                                    color: colorScheme.primary,
                                    height: height,
                                    maxLines: 1,
                                    horizontal: 10
                                ),
                                IconButton(
                                  icon: Icon(Icons.more_vert, color: colorScheme.primary),
                                  onPressed: () {
                                    showCustomBottomSheet(
                                        context,
                                            (context) {
                                          return const TrafficLight(
                                            title: 'Categorías de la glucosa',
                                            titles: ['Verde', 'Amarillo', 'Rojo'],
                                            colors: ['Verde', 'Amarillo', 'Rojo'],
                                          );});
                                    },
                                ),
                              ]
                          ),
                          if (state.valoresGlucosa.isEmpty)
                            AppTextStyles.autoBodyStyle(
                                text: 'No hay valores de la glucosa',
                                color: Colors.grey,
                                maxLines: 1,
                                height: height,
                                percent: 0.01,
                                horizontal: 10
                            )
                          else
                            ...state.valoresGlucosa.map((valor) {
                              return CardTimeline(
                                  titulo: valor.valor,
                                  hora: valor.hora,
                                  subtitulo: valor.medicion,
                                  color: valor.color
                              );
                            }),
                          Divider(
                              color: colorScheme.primary.withOpacity(0.2),
                              indent: 10,
                              endIndent: 10
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppTextStyles.autoBodyStyle(
                                    text: 'Presión arterial',
                                    color: colorScheme.primary,
                                    height: height,
                                    maxLines: 1,
                                    horizontal: 10
                                ),
                                IconButton(
                                  icon: Icon(Icons.more_vert, color: colorScheme.primary),
                                  onPressed: () {
                                    showCustomBottomSheet(
                                        context,
                                            (context) {
                                          return const TrafficLight(
                                            title: 'Categorías de la presión arterial',
                                            titles: ['Óptima', 'Normal', 'Normal Alta', 'Hipertensión Grado 1', 'Hipertensión Grado 2', 'Hipertensión Grado 3'],
                                            colors: ['Verde', 'Amarillo', 'Naranja Claro', 'Naranja', 'Naranja Oscuro', 'Rojo'],
                                          );
                                        });
                                    },
                                ),
                              ]
                          ),
                          if (state.valoresPresion.isEmpty)
                            AppTextStyles.autoBodyStyle(
                                text: 'No hay valores de la presión',
                                color: Colors.grey,
                                maxLines: 1,
                                height: height,
                                percent: 0.01,
                                horizontal: 10
                            )
                          else
                            ...state.valoresPresion.map((valor) {
                              return CardTimeline(
                                  titulo: valor.valor,
                                  hora: valor.hora,
                                  subtitulo: valor.medicion,
                                  color: valor.color
                              );
                            }),
                        ]
                    );
                  } else if (state is ValorResponseError) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      CustomSnackbar.show(
                        context:  context,
                        typeMessage: TypeMessage.error,
                        title: 'Error',
                        description: 'Vuelva a intentarlo más tarde',
                      );
                    });
                    return const SizedBox.shrink();
                  } else {
                    return const SizedBox.shrink();
                  }
                }
                )
          ],
        ),
      )
    );
  }

  @override
  bool get wantKeepAlive => true;

}