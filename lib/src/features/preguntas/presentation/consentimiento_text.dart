import 'package:intl/intl.dart';

class ConsentimientoText {

  static const titulo = 'Carta de consentimiento informado para participación en protocolos de investigación (adultos)';
  static const estudio = 'Estrategia de enfoque integral para mejorar el apego al autocuidado en pacientes con diabetes mellitus';
  static final lugar = 'Ixtaczoquitlán, Ver. A ${DateFormat('d \'de\' MMMM \'de\' y', 'es').format(DateTime.now())}';
  static const justificacion = 'Le invitamos a participar en un proyecto de investigación que tiene como objetivo identificar los aspectos relacionados con el autocuidado de la diabetes para poder ofrecer alternativas para su mejora.';
  static const procedimientos = 'Si usted acepta participar en el estudio, se le realizará un breve cuestionario para conocer su historial clínico, se incluirá en un programa de seguimiento estrecho para el control de la diabetes mediante el uso de una aplicaciónen su dispositivo móvil. Se proporcionarán sesiones individuales y grupales de asesoría y practica de cuidadode la glucosa, alimentación saludable y actividad física.';
  static const riesgos = 'Sin riesgos.';
  static const beneficios = 'Los beneficios que usted obtiene al paticipar en el estudio, son: conocer los niveles de glucosa en su sangre,modificar habitos, mejorar calidad de vida.';
  static const resultados = 'Los investigadores estamos comprometidos a responder cualquier pregunta y aclarar cualquier duda que se leplantee acerca de los procedimientos que se llevarán a cabo, información actualizada obtenida durante elestudio.';
  static const retiro = 'Usted conserva el derecho de continuar participando o retirarse del estudio en cualquier momento en que loconsidere conveniente.';
  static const privacidad = 'Sus datos personales serán codificados y protegidos de tal manera que solo pueden ser identificados por losInvestigadores de este estudio. Puede tener la seguridad de que NO se identificará su nombre ni otro datopersonal en las presentaciones o las publicaciones que deriven de este estudio.';

  static const declaracion = 'Declaración de consentimiento:';
  static const infoDeclaracion = 'Después de heber leído y habiéndoseme explicado todas mis dudas acerca de este estudio:';
  static const acepto = 'Acepto participar';
  static const noAcepto = 'No acepto participar';

  static const dudas = 'En caso de dudas o aclaraciones relacionadas con el estudio podrá dirigirse a:';
  static const investigador = 'Dra. Karla Cecilia Perez Osorio. Alumna Posgrado Maestría Dirección Estratégica e Innovación Tecnológica, Facultad Negocios y Tecnologías, Campus Ixtaczoquitlán, Ver. Tel. 2721163795';
  static const responsable = 'Dra. Yara Anahí Jiménez Nieto, Prof. Titular Posgrado Maestría Dirección Estratégica e Innovación Tecnológica, Facultad Negocios y Tecnologías, Campus Ixtaczoquitlán, Ver.';
  static const dudasParticipante = 'En caso de dudas o aclaraciones sobre sus derechos como participante podrá dirigirse a: Comité de Bioética de Investigación en Salud de la Facultad de Medicina de la Universidad Veracruzana, Campus Cuidad Mendoza, Ver.';

  static Map<String, String> getMapConsentimiento() {
    return {
      'Nombre del estudio': estudio,
      'Lugar y fecha': lugar,
      'Justificación y objetivo del estudio': justificacion,
      'Procedimientos': procedimientos,
      'Posibles riesgos y molestias': riesgos,
      'Posibles beneficios que recibirá al participar en el estudio': beneficios,
      'Información sobre resultados y alternativas de tratamiento': resultados,
      'Participación o retiro': retiro,
      'Privacidad y confidencialidad': privacidad,
    };
  }

  static Map<String, String> getMapContacto() {
    return {
      'Investigadora o Investigador': investigador,
      'Responsable': responsable
    };
  }

  static Map<String, String> getDeclaracion() {
    return {
      declaracion: infoDeclaracion,
      'si': acepto,
      'no': noAcepto
    };
  }

}