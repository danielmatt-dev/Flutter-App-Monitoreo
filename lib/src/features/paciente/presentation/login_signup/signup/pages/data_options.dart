import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/respuesta.dart';

final estadoOpciones = [
  'Soltero/a',
  'Casado/a',
  'Divorciado/a',
  'Viudo/a',
  'Unión Libre',
];

final mapEstado = {
  'Solter@' : 'Soltero/a',
  'Casad@' : 'Casado/a',
  'Divoriciad@' : 'Divorciado/a',
  'Viud@' : 'Viudo/a',
  'Unión Libre' : 'Unión Libre',
};

final estudiosOpciones = [
  'Ninguno',
  'Primaria',
  'Secundaria',
  'Preparatoria',
  'Universidad',
  'Postgrado'
];

final factorOpciones = [
  'Muy ligera',
  'Ligera',
  'Moderada',
  'Intensa'
];

final tipoOpciones = [
  'Tipo 1',
  'Tipo 2',
  'Desconozco mi tipo de diabetes'
];

final tiempoOpciones = [
  'Menos de 1 año',
  'De 1 a 5 años',
  'De 5 a 15 años',
  'Más de 15 años'
];

final visionRespuestas = Pregunta(
    idPregunta: 0,
    pregunta: '¿Consideras que tu visión es adecuada o has experimentado visión borrosa?',
    respuestas: [
      Respuesta(idRespuesta: 0, descripcion: 'Uso lentes o gafas', puntaje: 0),
      Respuesta(idRespuesta: 0, descripcion: 'A veces tengo visión borrosa', puntaje: 0),
      Respuesta(idRespuesta: 0, descripcion: 'He experimentado visión borrosa', puntaje: 0),
      Respuesta(idRespuesta: 0, descripcion: 'Mi visión es adecuada', puntaje: 0),
    ]
);


final somatometriaPreguntas = [

];



/*
final sensaciones = [
  Respuesta(idRespuesta: 0, descripcion: descripcion, puntaje: 0),
  Respuesta(idRespuesta: 0, descripcion: descripcion, puntaje: 0),
  Respuesta(idRespuesta: 0, descripcion: descripcion, puntaje: 0),
];
 */