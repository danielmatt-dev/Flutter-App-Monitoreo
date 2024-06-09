import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:equatable/equatable.dart';

class CrearRegistroRespuesta {

  RegistroRespuestas call(CrearRegistroRespuestaParams params) =>
      RegistroRespuestas(
          idPregunta: params.idPregunta,
          descripcionPregunta: params.descripcionPregunta,
          respuesta: params.respuesta,
          puntaje: params.puntaje
      );
}

class CrearRegistroRespuestaParams extends Equatable {

  final String idPregunta;
  final String descripcionPregunta;
  final String respuesta;
  final int puntaje;

  const CrearRegistroRespuestaParams({
    required this.idPregunta,
    required this.descripcionPregunta,
    required this.respuesta,
    required this.puntaje
  });

  @override
  List<Object?> get props => [idPregunta, descripcionPregunta, respuesta, puntaje];

}

// <>