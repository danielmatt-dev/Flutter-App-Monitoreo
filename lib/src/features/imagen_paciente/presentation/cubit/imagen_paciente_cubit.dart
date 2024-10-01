import 'dart:convert';

import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_request.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_search_request.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/usecases/buscar_imagenes.dart';
import 'package:app_plataforma/src/features/imagen_paciente/domain/usecases/guardar_imagen.dart';
import 'package:app_plataforma/src/features/imagen_paciente/presentation/cubit/imagen_paciente_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ImagenPacienteCubit extends Cubit<ImagenPacienteState> {

  final BuscarImagenes buscarImagenes;
  final GuardarImagen guardarImagen;

  ImagenPacienteCubit({
    required this.buscarImagenes,
    required this.guardarImagen
  }) : super(ImagenPacienteLoading());

  void buscarImagenesEvent(String tipoBusqueda) async {

    emit(ImagenPacienteLoading());

    final result = await buscarImagenes.call(ImagenPacienteSearchRequest(tipoBusqueda: tipoBusqueda));

    result.fold(
        (failure) => emit(ImagenPacienteError()),
        (imagenes) =>
          imagenes.isEmpty
              ? emit(EmptyListImagenPaciente())
              : emit(ListImagenPacienteSuccess(images: imagenes))
        );

  }

  void guardarImagenesEvent(String tipoImagen, XFile image) async {

    emit(ImagenPacienteLoading());

    final bytes = await image.readAsBytes();
    final imagenBase64 = base64Encode(bytes);

    final result = await guardarImagen.call(
        ImagenPacienteRequest(
            tipoImagen: tipoImagen,
            imagen: imagenBase64,
            fecha: DateFormat('yyyy-MM-dd').format(DateTime.now()),
            hora: DateFormat('HH:mm:ss').format(DateTime.now())
        )
    );

    result.fold(
          (failure) => emit(ImagenPacienteError()),
          (success) => emit(SaveImagenPacienteSuccess()),
    );
  }

}