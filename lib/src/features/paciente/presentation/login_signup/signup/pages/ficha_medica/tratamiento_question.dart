import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/template_quiz.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:app_plataforma/src/shared/widgets/list_tile_custom.dart';
import 'package:flutter/material.dart';

class TratamientoScreen extends StatefulWidget {

  final String question;
  final Map<String, List<Tratamiento>> tratamientos;
  final List<Tratamiento> selectedResponses;
  final Color? backgroundColor;
  final ValueChanged<List<Tratamiento>> onChanged;
  final Color? titleColor;

  const TratamientoScreen({
    super.key,
    required this.question,
    required this.tratamientos,
    this.selectedResponses = const [],
    this.backgroundColor,
    required this.onChanged,
    this.titleColor
  });

  @override
  State<TratamientoScreen> createState() => _TratamientoScreenState();
}

class _TratamientoScreenState extends State<TratamientoScreen> with AutomaticKeepAliveClientMixin<TratamientoScreen> {

  List<Tratamiento> selectedTratamientos = [];
  bool selectedNinguna = false;

  @override
  void initState() {
    super.initState();
    selectedTratamientos = List.from(widget.selectedResponses);
  }

  void _onChanged(Tratamiento tratamiento, bool selected) {
    setState(() {
      selected
          ? selectedTratamientos.add(tratamiento)
          : selectedTratamientos.remove(tratamiento);
    });
    widget.onChanged(selectedTratamientos);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                      fontWeight: FontWeight.bold
                  ),
                  Divider(color: colorScheme.primary.withOpacity(0.2),),
                  ...tratamiento.value.map((item) {
                    final isSelected = selectedTratamientos.contains(item);
                    return ListTileCustom(
                      title: item.nombre,
                      isSelected: isSelected,
                      withIcon: false,
                      withSubtitle: false,
                      onTap: () {
                        _onChanged(item, !isSelected);
                        selectedNinguna = false;
                      },
                      paddingLeft: 15,
                    );
                  }),
                ],
              );
            }),
            Divider(color: colorScheme.primary.withOpacity(0.2),),
            ListTileCustom(
              title: 'Ninguna de las anteriores',
              isSelected: selectedNinguna,
              withIcon: false,
              withSubtitle: false,
              fontWeightTitle: FontWeight.bold,
              titlePercent: 0.025,
              onTap: () {
                setState(() {
                  selectedTratamientos = [];
                  selectedNinguna = !selectedNinguna;
                });
                widget.onChanged(selectedTratamientos);
              }
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}