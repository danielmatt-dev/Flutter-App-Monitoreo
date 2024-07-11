import 'package:app_plataforma/src/features/valor/domain/entities/promedio.dart';
import 'package:app_plataforma/src/features/valor/data/models/impl/glucosa/valor_glucosa_request_model.dart';
import 'package:app_plataforma/src/features/valor/data/models/impl/presion/valor_presion_request_model.dart';
import 'package:app_plataforma/src/features/valor/data/models/promedio_model.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/impl/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/impl/valor_presion_request.dart';
import 'package:smartstruct/smartstruct.dart';

part 'impl/valor_mapper.mapper.g.dart';

@Mapper()
abstract class ValorMapper {

  ValorPresionRequestModel toValorPresionRequestModel(ValorPresionRequest entity);

  ValorGlucosaRequestModel toValorGlucosaRequestModel(ValorGlucosaRequest entity);

  Promedio toPromedio(PromedioModel model);

}
