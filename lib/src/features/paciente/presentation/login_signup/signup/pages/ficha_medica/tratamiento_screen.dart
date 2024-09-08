import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/template_quiz.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:app_plataforma/src/shared/widgets/list_tile_custom.dart';
import 'package:flutter/material.dart';

@immutable
class TratamientoScreen extends StatefulWidget {

  final String question;
  final Map<String, List<Tratamiento>> tratamientos;
  final List<Tratamiento> selectedResponses;
  final Color? backgroundColor;
  final ValueChanged<TratamientoSelection> onChanged;
  final Color? titleColor;
  late bool selectedNinguna;

  TratamientoScreen({
    super.key,
    required this.question,
    required this.tratamientos,
    this.selectedResponses = const [],
    this.backgroundColor,
    required this.onChanged,
    this.titleColor,
    this.selectedNinguna = false,
  });

  @override
  State<TratamientoScreen> createState() => _TratamientoScreenState();
}

class _TratamientoScreenState extends State<TratamientoScreen> with AutomaticKeepAliveClientMixin<TratamientoScreen> {
  List<Tratamiento> selectedTratamientos = [];

  @override
  void initState() {
    super.initState();
    selectedTratamientos = widget.selectedResponses;
  }

  void _onChanged(Tratamiento tratamiento, bool selected) {
    setState(() {
      if (selected) {
        selectedTratamientos.add(tratamiento);
        widget.selectedNinguna = false;
      } else {
        selectedTratamientos.remove(tratamiento);
      }
    });

    widget.onChanged(
      TratamientoSelection(
        tratamientosSeleccionados: selectedTratamientos,
        ningunaSeleccionada: widget.selectedNinguna,
      ),
    );
  }

  void _onNingunaSeleccionada() {
    setState(() {
      selectedTratamientos.clear();
      widget.selectedNinguna = !widget.selectedNinguna;
    });

    widget.onChanged(
      TratamientoSelection(
        tratamientosSeleccionados: selectedTratamientos,
        ningunaSeleccionada: widget.selectedNinguna,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TemplateQuiz(
          question: widget.question,
          children: [
            ...widget.tratamientos.entries.map((tratamiento) {
              final isOral = tratamiento.key == 'Oral';

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextStyles.autoBodyStyle(
                    text: isOral ? 'Medicamentos orales' : tratamiento.key,
                    color: widget.titleColor ?? colorScheme.secondary,
                    height: height,
                    fontWeight: FontWeight.bold,
                  ),
                  Divider(color: colorScheme.primary.withOpacity(0.2)),
                  ...tratamiento.value.map((item) {
                    final isSelected = selectedTratamientos.contains(item);
                    return ListTileCustom(
                      title: item.nombre,
                      isSelected: isSelected,
                      withIcon: false,
                      withSubtitle: false,
                      onTap: () {
                        _onChanged(item, !isSelected);
                      },
                      paddingLeft: 15,
                    );
                  }),
                ],
              );
            }),
            Divider(color: colorScheme.primary.withOpacity(0.2)),
            ListTileCustom(
              title: 'Ninguna de las anteriores',
              isSelected: widget.selectedNinguna,
              withIcon: false,
              withSubtitle: false,
              fontWeightTitle: FontWeight.bold,
              titlePercent: 0.025,
              onTap: _onNingunaSeleccionada,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TratamientoSelection {
  final List<Tratamiento> tratamientosSeleccionados;
  final bool ningunaSeleccionada;

  TratamientoSelection({
    required this.tratamientosSeleccionados,
    required this.ningunaSeleccionada,
  });
}
