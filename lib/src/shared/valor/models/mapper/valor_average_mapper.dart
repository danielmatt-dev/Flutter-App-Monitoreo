import 'package:app_plataforma/src/shared/valor/entities/valor_average.dart';
import 'package:app_plataforma/src/shared/valor/models/valor_average_model.dart';
import 'package:smartstruct/smartstruct.dart';

part 'valor_average_mapper.mapper.g.dart';

@Mapper()
abstract class ValorAverageMapper {

  @Mapping(target: 'titulo', ignore: true)
  ValorAverage toValorAverage(ValorAverageModel model);

}