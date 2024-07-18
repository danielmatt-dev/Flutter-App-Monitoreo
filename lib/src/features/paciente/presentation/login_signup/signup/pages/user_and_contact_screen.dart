import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_custom.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_password.dart';
import 'package:flutter/material.dart';

class UserAndContactScreen extends StatefulWidget {

  const UserAndContactScreen({super.key});

  @override
  State<UserAndContactScreen> createState() => _UserAndContactScreenState();
}

class _UserAndContactScreenState extends State<UserAndContactScreen> {

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPaternoController = TextEditingController();
  final TextEditingController _apellidoMaternoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    _nombreController.dispose();
    _apellidoPaternoController.dispose();
    _apellidoMaternoController.dispose();
    _telefonoController.dispose();
    _correoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          InfoSection(
            title: 'Usuario',
            children: [
              FastTextFieldCustom(
                controller: _correoController,
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
          InfoSection(
            title: 'Contacto',
            children: [
              FastTextFieldCustom(
                controller: _nombreController,
                labelText: 'Nombre',
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
              FastTextFieldCustom(
                controller: _apellidoPaternoController,
                labelText: 'Apellido Paterno',
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
              FastTextFieldCustom(
                controller: _apellidoMaternoController,
                labelText: 'Apellido Materno',
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
              FastTextFieldCustom(
                controller: _telefonoController,
                labelText: 'Teléfono',
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
            ],
          ),
        ],
      ),
    );
  }
}
