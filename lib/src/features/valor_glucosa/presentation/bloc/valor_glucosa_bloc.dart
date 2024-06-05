import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_response.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/buscar_valores_dia.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'valor_glucosa_event.dart';
part 'valor_glucosa_state.dart';

class ValorGlucosaBloc extends Bloc<ValorGlucosaEvent, ValorGlucosaState>{

  final BuscarValoresDia buscarValoresDia;
  final IngresarValorGlucosa ingresarValorGlucosa;
  final CapturarValorGlucosa capturarValorGlucosa;

}

// <>