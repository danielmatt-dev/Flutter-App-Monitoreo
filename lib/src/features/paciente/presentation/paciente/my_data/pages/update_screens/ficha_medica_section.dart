import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/signup_screens.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FichaMedicaSection extends StatefulWidget {

  final TextEditingController tipoController;
  final TextEditingController tiempoController;

  const FichaMedicaSection({
    super.key,
    required this.tipoController,
    required this.tiempoController
  });

  @override
  State<FichaMedicaSection> createState() => _FichaMedicaSectionState();

}

class _FichaMedicaSectionState extends State<FichaMedicaSection> with AutomaticKeepAliveClientMixin<FichaMedicaSection> {

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<PacienteBloc, PacienteState>(
      listener: (context, state) {
        if (state is PacienteUpdateMedicosSuccess) {
          CustomSnackbar.show(
              context: context,
              typeMessage: TypeMessage.success,
              title: MessagesSnackbar.updateSuccess,
              description: 'Los datos se actualizaron correctamente'
          );
          Navigator.pop(context);
        } else if(state is PacienteNonValidateUpdate){
          CustomSnackbar.show(
              context: context,
              typeMessage: TypeMessage.warning,
              title: 'Correo ya registrado',
              description: 'Por favor, usa un correo diferente.'
          );
        } else if (state is PacienteError) {
          CustomSnackbar.show(
            context: context,
            typeMessage: TypeMessage.error,
            title: MessagesSnackbar.error,
            description: MessagesSnackbar.messageConnectionError,
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            TemplateQuestion(
              question: 'Tipo de diabetes',
              answers: tipoOpciones,
              selectedResponse: widget.tipoController.text,
              onSelectedResponse: (value) {
                setState(() {
                  widget.tipoController.text = tipoOpciones[value];
                });
              },
            ),
            TemplateQuestion(
              question: 'Tiempo con diabetes',
              answers: tiempoOpciones,
              selectedResponse: widget.tiempoController.text,
              onSelectedResponse: (value) {
                setState(() {
                  widget.tiempoController.text = tiempoOpciones[value];
                });
              },
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.015),
          ],
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;

}