import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/mediciones/presentation/cubit/medicion_cubit.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/valor_request.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/widgets/template_screen_measurement.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({super.key});

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  final medicionCubit = sl<MedicionCubit>();
  List<String> measurements = [];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final tabs = [
      Tab(
        child: AppTextStyles.autoBodyStyle(
            text: 'Glucosa',
            color: colorScheme.primary,
            size: SizeIcon.size16
        ),
      ),
      Tab(
        child: AppTextStyles.autoBodyStyle(
            text: 'Presión arterial',
            color: colorScheme.primary,
            size: SizeIcon.size16
        ),
      ),
    ];

    return SafeArea(
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          appBar: AppBar(
            title: AppTextStyles.autoBodyStyle(
              text: 'Instrucciones',
              color: colorScheme.primary,
              size: SizeIcon.size22
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: tabs,
              dividerColor: colorScheme.primary.withOpacity(0.2),
            ),
          ),
          body: const TabBarView(
            children: [
              TemplateScreenMeasurement(
                  tipo: TipoMedicion.glucosa
              ),
              TemplateScreenMeasurement(
                  tipo: TipoMedicion.presion
              ),
            ],
          ),
        ),
      ),
    );
  }

}