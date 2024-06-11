import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/valor_glucosa/presentation/bloc/valor_glucosa_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// <>
class AverageCard extends StatelessWidget {

  const AverageCard({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ValorGlucosaBloc, ValorGlucosaState>(
        builder: (context, state) {
          if(state is ValorGlucosaLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ValorGlucosaAverageSuccess) {
            return Card(
              elevation: 0.5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              color: colorScheme.background,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: AppTextStyles.autoBodyStyle(
                            text: state.valorAverage.titulo,
                            color: colorScheme.onBackground,
                            height: height,
                            maxLines: 1,
                            percent: 0.03
                        )
                    ),
                    SizedBox(
                      height: height * 0.18,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: CircularPercentIndicator(
                          radius: height * 0.15,
                          lineWidth: height*0.015,
                          animation: true,
                          arcType: ArcType.HALF,
                          percent: state.valorAverage.calcularPorcentaje(),
                          arcBackgroundColor: Colors.grey.withOpacity(0.3),
                          startAngle: 270,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: state.valorAverage.buscarColor(),
                          center: Column(
                            children: [
                              AppSizeBoxStyle.sizeBox(
                                  height: height,
                                  percentage: 0.08
                              ),
                              AppTextStyles.autoBodyStyle(
                                  text: '${state.valorAverage.promedio}',
                                  color: colorScheme.onBackground,
                                  height: height,
                                  maxLines: 1,
                                  percent: 0.035
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: AppTextStyles.autoBodyStyle(
                              text: '${state.valorAverage.valorMinimo}',
                              color: colorScheme.onBackground,
                              maxLines: 1,
                              height: height,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: AppTextStyles.autoBodyStyle(
                              text: '0',
                              color: colorScheme.onBackground,
                              maxLines: 1,
                              height: height,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: AppTextStyles.autoBodyStyle(
                              text: '${state.valorAverage.valorMaximo}',
                              color: colorScheme.primary,
                              maxLines: 1,
                              height: height,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );

          } else if (state is ValorGlucosaError) {
            return Center(child: Text(state.error),);
          } else {
            return const Center(child: Text('Desconocido'),);
          }
        }
    );

  }

}