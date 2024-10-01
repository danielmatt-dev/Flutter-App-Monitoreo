import 'package:app_plataforma/src/features/imagen_paciente/data/models/imagen_paciente_request_model.dart';
import 'package:app_plataforma/src/features/imagen_paciente/data/models/imagen_paciente_response_model.dart';
import 'package:app_plataforma/src/features/imagen_paciente/data/models/imagen_paciente_search_request_model.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_request.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_response.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_search_request.dart';
import 'package:smartstruct/smartstruct.dart';

part 'imagen_paciente_mapper.mapper.g.dart';

@Mapper()
abstract class ImagenPacienteMapper {

  ImagenPacienteRequestModel toImagenPacienteRequestModel(ImagenPacienteRequest request);

  ImagenPacienteResponseModel toImagenPacienteResponseModel(ImagenPacienteResponse response);

  ImagenPacienteSearchRequestModel toImagenPacienteSearchResponseModel(ImagenPacienteSearchRequest response);

}