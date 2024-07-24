import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/contacto_section.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_password.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:flutter/material.dart';

class UserAndContactScreen extends StatefulWidget {

  final TextEditingController nombreController;
  final TextEditingController apellidoPaternoController;
  final TextEditingController apellidoMaternoController;
  final TextEditingController telefonoController;
  final TextEditingController correoController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const UserAndContactScreen({
    super.key,
    required this.nombreController,
    required this.apellidoPaternoController,
    required this.apellidoMaternoController,
    required this.telefonoController,
    required this.correoController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  State<UserAndContactScreen> createState() => _UserAndContactScreenState();
}

class _UserAndContactScreenState extends State<UserAndContactScreen> with AutomaticKeepAliveClientMixin<UserAndContactScreen> {

  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  void _toggleNewPasswordVisibility() {
    setState(() {
      _obscureNewPassword = !_obscureNewPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  void dispose() {
    widget.nombreController.dispose();
    widget.apellidoPaternoController.dispose();
    widget.apellidoMaternoController.dispose();
    widget.telefonoController.dispose();
    widget.correoController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          InfoSection(
            title: 'Usuario',
            children: [
              FastTextFieldTitleCustom(
                controller: widget.correoController,
                labelText: 'Correo',
                hintText: 'correo@example.com',
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
              FastTextFieldPassword(
                onChanged: (value) {},
                labelText: 'Contraseña',
                isInvalid: false,
                errorText: 'Mínimo 8 caracteres\nAl menos una letra\nAl menos un número',
                toggleVisibility: _toggleNewPasswordVisibility,
                obscureText: _obscureNewPassword,
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
              FastTextFieldPassword(
                onChanged: (value) {},
                labelText: 'Confirmar contraseña',
                isInvalid: false,
                errorText: 'La contraseña nueva no coincide con la contraseña confirmada.',
                toggleVisibility: _toggleConfirmPasswordVisibility,
                obscureText: _obscureConfirmPassword,
              ),
            ],
          ),
          ContactoSection(
              nombreController: widget.nombreController,
              apellidoPaternoController: widget.apellidoPaternoController,
              apellidoMaternoController: widget.apellidoMaternoController,
              telefonoController: widget.telefonoController,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}
