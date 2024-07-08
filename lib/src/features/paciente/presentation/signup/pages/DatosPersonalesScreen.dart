import 'package:app_plataforma/src/features/direccion/presentation/widgets/text_field_custom.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/respuesta.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/question_widget.dart';
import 'package:flutter/material.dart';

class DatosPersonalesScreen extends StatefulWidget {
  const DatosPersonalesScreen({super.key});

  @override
  State<DatosPersonalesScreen> createState() => _DatosPersonalesScreenState();
}

class _DatosPersonalesScreenState extends State<DatosPersonalesScreen> {

  final PageController _pageController = PageController();
  final Map<int, dynamic> _respuestas = {};
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    final preguntas = [
      Pregunta(idPregunta: 11, pregunta: 'Género', respuestas: _generoOptions()),
      Pregunta(idPregunta: 12, pregunta: 'Estado Civil', respuestas: _estadoCivilOptions()),
      Pregunta(idPregunta: 13, pregunta: 'Nivel de Estudios', respuestas: _nivelEstudiosOptions()),
      Pregunta(idPregunta: 14, pregunta: 'Factor de Actividad', respuestas: _factorActividadOptions()),
      Pregunta(idPregunta: 15, pregunta: 'Tipo de Diabetes', respuestas: _tipoDiabetesOptions()),
      Pregunta(idPregunta: 16, pregunta: 'Tiempo con Diabetes', respuestas: _tiempoDiabetesOptions()),
    ];

    final totalPages = preguntas.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Personales'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Pregunta ${_currentPage + 1}/$totalPages',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colorScheme.secondary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LinearProgressIndicator(
              value: (_currentPage + 1) / totalPages,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: totalPages,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                  final pregunta = preguntas[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: QuestionWidget(
                      question: pregunta.pregunta,
                      answers: pregunta.respuestas,
                      sizePreguntas: totalPages,
                      onSelectedResponse: (respuesta) {
                        setState(() {
                          _respuestas[pregunta.idPregunta] = respuesta;
                        });
                      },
                      selectedResponse: _respuestas[pregunta.idPregunta],
                    ),
                  );
                }
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentPage != 0)
                ElevatedButton.icon(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: Icon(Icons.arrow_back, color: colorScheme.secondary),
                  label: Text(
                    'ANTERIOR',
                    style: TextStyle(color: colorScheme.secondary),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.background,
                    side: BorderSide(color: colorScheme.secondary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              if (_currentPage != totalPages - 1)
                ElevatedButton.icon(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: Text(
                    'SIGUIENTE',
                    style: TextStyle(color: colorScheme.background),
                  ),
                  label: Icon(Icons.arrow_forward, color: colorScheme.background),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<Respuesta> _generoOptions() => [
    Respuesta(idRespuesta: 1, descripcion: 'Hombre', puntaje: 0),
    Respuesta(idRespuesta: 2, descripcion: 'Mujer', puntaje: 0),
    Respuesta(idRespuesta: 3, descripcion: 'Otro', puntaje: 0),
  ];

  List<Respuesta> _estadoCivilOptions() => [
    Respuesta(idRespuesta: 1, descripcion: 'Soltero', puntaje: 0),
    Respuesta(idRespuesta: 2, descripcion: 'Casado', puntaje: 0),
    Respuesta(idRespuesta: 3, descripcion: 'Divorciado', puntaje: 0),
    Respuesta(idRespuesta: 4, descripcion: 'Viudo', puntaje: 0),
  ];

  List<Respuesta> _nivelEstudiosOptions() => [
    Respuesta(idRespuesta: 1, descripcion: 'Primaria', puntaje: 0),
    Respuesta(idRespuesta: 2, descripcion: 'Secundaria', puntaje: 0),
    Respuesta(idRespuesta: 3, descripcion: 'Preparatoria', puntaje: 0),
    Respuesta(idRespuesta: 4, descripcion: 'Universidad', puntaje: 0),
  ];

  List<Respuesta> _factorActividadOptions() => [
    Respuesta(idRespuesta: 1, descripcion: 'Bajo', puntaje: 0),
    Respuesta(idRespuesta: 2, descripcion: 'Moderado', puntaje: 0),
    Respuesta(idRespuesta: 3, descripcion: 'Alto', puntaje: 0),
  ];

  List<Respuesta> _tipoDiabetesOptions() => [
    Respuesta(idRespuesta: 1, descripcion: 'Tipo 1', puntaje: 0),
    Respuesta(idRespuesta: 2, descripcion: 'Tipo 2', puntaje: 0),
  ];

  List<Respuesta> _tiempoDiabetesOptions() => [
    Respuesta(idRespuesta: 1, descripcion: 'Menos de 1 año', puntaje: 0),
    Respuesta(idRespuesta: 2, descripcion: '1-5 años', puntaje: 0),
    Respuesta(idRespuesta: 3, descripcion: 'Más de 5 años', puntaje: 0),
  ];

}
