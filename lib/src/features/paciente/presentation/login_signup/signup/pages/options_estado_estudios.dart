
final estadoOpciones = [
  'Soltero/a',
  'Casado/a',
  'Divorciado/a',
  'Separado/a en proceso judicial',
  'Viudo/a',
  'Unión Libre',
];

List<String> getEstadoOpciones(String genero) {

  final reemplazar = genero == 'Masculino' ? 'o' : 'a';

  return estadoOpciones.map((estado) =>
      estado.replaceAll('@', reemplazar))
      .toList();

}

final estudiosOpciones = [
  'Ninguno',
  'Primaria',
  'Secundaria',
  'Preparatoria',
  'Universidad',
  'Postgrado'
];
