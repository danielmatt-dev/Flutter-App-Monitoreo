import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/doctor/domain/entities/doctor.dart';
import 'package:app_plataforma/src/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:app_plataforma/src/features/doctor/presentation/cubit/validaciones/clave_doctor_validation.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
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
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        if (state is DoctorError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                    children: [
                      if(isTextFieldVisible)
                      FastTextFieldTitleCustom(
                        controller: widget.doctorController,
                        labelText: 'Clave del doctor',
                        onChanged: (value) => doctorCubit.onClaveDoctorChanged(value),
                        isInvalid: errorMessage != '',
                        errorText: errorMessage,
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
                              height: height,
                              percent: 0.02
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
                              return DoctorListItem(
                                  doctor: doctor,
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
          ),
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;

}

class DoctorListItem extends StatelessWidget {
  final Doctor doctor;
  final bool isSelected;
  final VoidCallback onTap;

  const DoctorListItem({
    super.key,
    required this.doctor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const CircleAvatar(
        child: Icon(Icons.person_rounded),
      ),
      title: AppTextStyles.autoBodyStyle(
          text: '${doctor.nombre} ${doctor.apellidoPaterno}',
          color: colorScheme.secondary,
          height: height,
          maxLines: 2
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextStyles.autoBodyStyle(
              text: doctor.especialidad,
              color: colorScheme.secondary,
              height: height,
              percent: 0.018
          ),
          AppTextStyles.autoBodyStyle(
              text: 'Cédula: ${doctor.cedulaProfesional}',
              color: colorScheme.secondary,
              height: height,
              percent: 0.018
          ),
        ],
      ),
      trailing: Icon(
        isSelected ? Icons.check_circle : Icons.check_circle_outline,
        color: isSelected ? Colors.green : null,
      ),
      onTap: onTap,
    );
  }
}