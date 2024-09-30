import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:app_plataforma/src/features/doctor/presentation/cubit/validaciones/clave_doctor_validation.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:app_plataforma/src/shared/widgets/list_tile_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// <>
class DoctorScreen extends StatefulWidget {

  final TextEditingController doctorController;

  const DoctorScreen({super.key, required this.doctorController});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> with AutomaticKeepAliveClientMixin<DoctorScreen> {

  final doctorCubit = sl<DoctorCubit>();
  bool isTextFieldVisible = true;

  void _selectedDoctor(String clave){
    setState(() {
      widget.doctorController.text = clave;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        if (state is DoctorError) {
        }
      },
      builder: (context, state) {

        String errorMessage = '';
        if (state is ClaveFormState && !state.status.isValid) {
          if (state.clave.error == ClaveValidationError.isEmpty) {
            errorMessage = 'La clave no puede estar vacía';
          } else if (state.clave.error == ClaveValidationError.invalidFormat) {
            errorMessage = 'Formato de clave inválido';
          }
        }

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
              children: [
                if(isTextFieldVisible)
                  TextFieldTitleCustom(
                    controller: widget.doctorController,
                    labelText: 'Clave del doctor',
                    onChanged: (value) => doctorCubit.onClaveDoctorChanged(value),
                    isInvalid: errorMessage != '',
                    errorText: errorMessage,
                    helpIcon: true,
                    onPressed: () {
                      CustomSnackbar.show(
                          context: context,
                          typeMessage: TypeMessage.info,
                          title: 'Clave del doctor',
                          description: 'Se refiere al identificador único asignado a su doctor para autenticar y verificar su identidad'
                      );
                      },
                  ),
                GestureDetector(
                  onTap: () {
                    isTextFieldVisible = !isTextFieldVisible;
                    doctorCubit.buscarDoctores();
                    },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: AppTextStyles.autoBodyStyle(
                        text: isTextFieldVisible ? 'No tengo clave del doctor' : 'Ingresar clave del doctor',
                        color: colorScheme.secondary,
                        size: SizeIcon.size16
                    ),
                  ),
                ),
                if(!isTextFieldVisible)
                  BlocBuilder<DoctorCubit, DoctorState>(
                    buildWhen: (previous, current) {
                      return current is DoctorLoadSuccess;
                      },
                    bloc: doctorCubit,
                    builder: (context, state) {
                      if(state is DoctorLoading){
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is DoctorLoadSuccess) {
                        return Column(
                            children: state.doctores.map((doctor) {
                              final isSelected = doctor.clave == widget.doctorController.text;
                              return ListTileCustom(
                                  title: '${doctor.nombre} ${doctor.apellidoPaterno}',
                                  withSubtitle: true,
                                  subtitle: doctor.especialidad,
                                  text: 'Cédula profesional: ${doctor.cedulaProfesional}',
                                  isSelected: isSelected,
                                  onTap: () => _selectedDoctor(doctor.clave)
                              );
                            }).toList()
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                      },
                  )
              ]
          ),
        );
      }
      );
  }

  @override
  bool get wantKeepAlive => true;

}