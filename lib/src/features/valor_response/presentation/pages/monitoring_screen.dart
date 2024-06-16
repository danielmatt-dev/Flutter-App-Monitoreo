import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/valor_response/presentation/bloc/valor_response_bloc.dart';
import 'package:app_plataforma/src/features/valor_response/presentation/widgets/card_timeline.dart';
import 'package:app_plataforma/src/features/valor_response/presentation/widgets/table_calendar.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    String formattedSelectedDate = selectedDate != null
        ? DateFormat('EEEE, d MMMM', 'es_ES').format(selectedDate!)
        : DateFormat('EEEE, d MMMM', 'es_ES').format(today);

    return BlocProvider<ValorResponseBloc>(
      create: (context) => valorResponseBloc,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.002),
              TableCalendarWidget(
                today: today,
                selectedDate: selectedDate,
                onDaySelected: _onDaySelected,
              ),
              AppSizeBoxStyle.sizeBox(height: height),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: AppTextStyles.autoBodyStyle(
                      text: formattedSelectedDate,
                      color: colorScheme.onBackground,
                      maxLines: 1,
                      height: height,
                      percent: 0.025
                  ),
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
                          AppTextStyles.autoBodyStyle(
                              text: 'Glucosa',
                              color: colorScheme.primary,
                              height: height,
                              maxLines: 1,
                              horizontal: 10
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
                          AppTextStyles.autoBodyStyle(
                            text: 'Presión',
                            color: colorScheme.primary,
                            height: height,
                            maxLines: 1,
                            horizontal: 10
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
                      return Center(child: Text(state.error));
                    } else {
                      return const Center(child: Text('Desconocido'));
                    }
                  }
              )
            ],
          ),
        ),
      )
    );

  }

  @override
  bool get wantKeepAlive => true;

}

Widget _levels({
  required double height,
  required List<String> categories,
  required Color textColor,
}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      _level(height: height, textColor: textColor, color: Colors.green, text: categories[0]),
      const SizedBox(width: 10,),
      _level(height: height, textColor: textColor, color: Colors.yellow, text: categories[1]),
      const SizedBox(width: 10,),
      _level(height: height, textColor: textColor, color: Colors.red, text: categories[2]),
      const SizedBox(width: 10,),
    ],
  );
}

Widget _level({
  required double height,
  required Color textColor,
  required Color color,
  required String text
}) {
  return Row(
      children: [
        CircleAvatar(
          radius: 7,
          backgroundColor: color,
        ),
        const SizedBox(width: 3),
        AppTextStyles.autoBodyStyle(
            text: text,
            maxLines: 1,
            height: height,
            percent: 0.02,
            color: textColor
        ),
      ]
  );
}
