import 'package:app_plataforma/src/features/promedio/data/models/promedio_model.dart';
import 'package:app_plataforma/src/features/promedio/domain/entities/promedio.dart';
import 'package:smartstruct/smartstruct.dart';

part 'promedio_mapper.mapper.g.dart';

@Mapper()
abstract class PromedioMapper {

  @Mapping(target: 'titulo', ignore: true)
  Promedio toPromedio(PromedioModel model);

}