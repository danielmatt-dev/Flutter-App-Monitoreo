import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/comentario/presentation/cubit/comentario_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:app_plataforma/src/shared/widgets/icon_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComentarioScreen extends StatefulWidget {

  const ComentarioScreen({super.key});

  @override
  State<ComentarioScreen> createState() => _ComentarioScreenState();

}

class _ComentarioScreenState extends State<ComentarioScreen> {

  final _comentarioController = TextEditingController();
  final comentarioCubit = sl<ComentarioCubit>();

  _guardarComentario(){

    const title = 'Comentario no válido';

    if(_comentarioController.text.isEmpty){
      CustomSnackbar.show(
          context: context,
          typeMessage: TypeMessage.warning,
          title: title,
          description: 'El comentario esta vacío'
      );
    }

    if(_comentarioController.text.length > 150){
      CustomSnackbar.show(
          context: context,
          typeMessage: TypeMessage.warning,
          title: title,
          description: 'Longitud máxima de 150 caracteres'
      );
    }

    comentarioCubit.guardarComentarioEvent(_comentarioController.text);
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.onPrimary,
        appBar: const AppBarCustom(title: 'Comentarios'),
        body: BlocListener<ComentarioCubit, ComentarioState>(
          listener: (context, state) {
            if(state is ComentarioError){
              CustomSnackbar.show(
                context: context,
                typeMessage: TypeMessage.error,
                title: 'Error',
                description: 'Vuelva a intentarlo más tarde',
                duration: 3
              );
            } else if (state is ComentarioSucess){

              _comentarioController.clear();
              Navigator.pop(context);

              SchedulerBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  CustomSnackbar.show(
                    context: context,
                    typeMessage: TypeMessage.success,
                    title: 'Éxito',
                    description: 'Comentario guardado',
                    closed: false,
                    duration: 3
                  );
                }
              });

            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFieldTitleCustom(
                  controller: _comentarioController,
                  labelText: 'Enviar comentarios',
                  hintText: 'Escribe tu opinión ... ',
                  typeKeyboard: TextInputType.text,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(150)
                  ],
                  maxLenght: 150,
                  maxLines: 5,
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                IconButtonCustom(
                  onPressed: _guardarComentario,
                  text: 'Enviar',
                  color: colorScheme.primary,
                  icon: Icons.access_time_filled_sharp,
                  horizontal: 0,
                )
                ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _comentarioController.dispose();
    super.dispose();
  }

}