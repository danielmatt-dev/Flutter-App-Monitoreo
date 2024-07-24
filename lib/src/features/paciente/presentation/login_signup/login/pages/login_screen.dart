import 'package:app_plataforma/src/core/menu/menu_navigation_controller.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/direccion/presentation/widgets/text_field_custom.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/cubit/auth_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/register_main.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/widgets/text_field_password.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:formz/formz.dart';

// <>
/*
class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  late AuthCubit authCubit = sl<AuthCubit>();

  final TextEditingController _correoController = TextEditingController();
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.secondary,
              colorScheme.background,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: colorScheme.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextStyles.autoTitleStyle(
                          text: 'Inicio de Sesión',
                          color: colorScheme.onBackground,
                          height: height,
                        ),
                        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                        BlocConsumer<AuthCubit, AuthState>(
                          cubit: authCubit,
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const MenuNavigationController()),
                              );
                            } else if (state is LoginError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Error al iniciar sesión')),
                              );
                            }
                          },
                          builder: (context, state) {
                            return Column(
                              children: [
                                TextFieldCustom(
                                  controller: _correoController,
                                  labelText: 'Correo',
                                  isInvalid: state.email.invalid,
                                  errorText: 'Ingresa un correo válido',
                                  onChanged: (value) {
                                    authCubit.emailChanged(value);
                                  },
                                ),
                                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                                TextFieldPassword(
                                  onChanged: (value) {
                                    authCubit.passwordChanged(value);
                                  },
                                  labelText: 'Contraseña',
                                  isInvalid: state.password.invalid,
                                  errorText: 'Mínimo 8 caracteres\nAl menos una letra\nAl menos un número',
                                  toggleVisibility: _togglePasswordVisibility,
                                  obscureText: _obscurePassword,
                                ),
                              ],
                            );
                          },
                        ),
                        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                        BlocBuilder<AuthCubit, AuthState>(
                          cubit: authCubit,
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state.status.isValidated
                                  ? () {
                                FocusScope.of(context).unfocus(); // Ocultar el teclado
                                authCubit.loginPaciente();
                              }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.onBackground,
                                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: AppTextStyles.autoBodyStyle(
                                text: 'COMENZAR',
                                color: Colors.white,
                                height: height,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navegar a la pantalla de "Olvidó su contraseña"
                    },
                    child: AppTextStyles.autoBodyStyle(
                      text: 'Olvidó su contraseña',
                      color: colorScheme.primary,
                      height: height,
                      percent: 0.03
                    ),
                  ),
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainRegister()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: colorScheme.primary),
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: AppTextStyles.autoBodyStyle(
                    text: 'CREAR CUENTA',
                    color: colorScheme.primary,
                    height: height,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
 */

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color(0xFF196092)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(0,size.height*-0.0014286);
    path_0.lineTo(size.width*0.9975000,size.height*0.0028571);
    path_0.lineTo(size.width,size.height*0.4328571);
    path_0.quadraticBezierTo(size.width*0.8754750,size.height*0.5705857,size.width*0.6749750,size.height*0.5534714);
    path_0.cubicTo(size.width*0.4819417,size.height*0.5035286,size.width*0.4409750,size.height*0.3634286,size.width*0.2640417,size.height*0.3175000);
    path_0.quadraticBezierTo(size.width*0.1490333,size.height*0.2854429,size.width*-0.0017750,size.height*0.2913857);
    path_0.lineTo(0,size.height*-0.0014286);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);


    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color(0xFF196092)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class RPSCustomPainter2 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color(0xFF0377A7)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.0008333,size.height*0.0014286);
    path_0.lineTo(size.width,size.height*0.0028571);
    path_0.lineTo(size.width*1.0017750,size.height*0.4325714);
    path_0.quadraticBezierTo(size.width*0.9394333,size.height*0.5319571,size.width*0.8699417,size.height*0.5464286);
    path_0.cubicTo(size.width*0.7998083,size.height*0.5666000,size.width*0.6717250,size.height*0.4568857,size.width*0.5306083,size.height*0.5552714);
    path_0.cubicTo(size.width*0.3979333,size.height*0.6476000,size.width*0.3757083,size.height*0.8055571,size.width*0.2658083,size.height*0.8123143);
    path_0.quadraticBezierTo(size.width*0.1678333,size.height*0.8157000,size.width*0.0017833,size.height*0.7124429);
    path_0.lineTo(size.width*0.0008333,size.height*0.0014286);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color(0xFF0377A7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paint_stroke_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class RPSCustomPainter3 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0016667,size.height*0.0014286);
    path_0.lineTo(size.width*-0.0008333,size.height*0.0014286);
    path_0.lineTo(size.width*0.9983333,size.height*0.0014286);
    path_0.lineTo(size.width*1.0005000,size.height*0.5311429);
    path_0.quadraticBezierTo(size.width*0.7487917,size.height*0.5334857,size.width*0.6427250,size.height*0.5878857);
    path_0.cubicTo(size.width*0.5514750,size.height*0.6308857,size.width*0.4940000,size.height*0.8698000,size.width*0.3669417,size.height*0.8933571);
    path_0.quadraticBezierTo(size.width*0.2415083,size.height*0.9120286,size.width*-0.0006000,size.height*0.5939429);
    path_0.lineTo(size.width*-0.0016667,size.height*0.0014286);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class WaveClipper extends CustomClipper<Path> {
  final double waveHeight;
  final double waveLength;
  final bool isReversed;

  WaveClipper({this.waveHeight = 50.0, this.waveLength = 100.0, this.isReversed = false});

  @override
  Path getClip(Size size) {
    var path = Path();
    double waveFrequency = size.width / waveLength;

    if (isReversed) {
      path.moveTo(0, size.height);
      path.lineTo(0, size.height - waveHeight);
    } else {
      path.moveTo(0, waveHeight);
    }

    for (double i = 0; i <= waveFrequency; i++) {
      double x = i * waveLength;
      if (i % 2 == 0) {
        path.quadraticBezierTo(x + waveLength / 4, isReversed ? size.height : 0, x + waveLength / 2, isReversed ? size.height - waveHeight : waveHeight);
      } else {
        path.quadraticBezierTo(x + waveLength / 4, isReversed ? 0 : size.height - waveHeight, x + waveLength / 2, isReversed ? waveHeight : size.height);
      }
    }

    path.lineTo(size.width, size.height);
    if (!isReversed) {
      path.lineTo(size.width, 0);
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SignInScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: height * 0.3,
                    width: width,
                    child: CustomPaint(
                      painter: RPSCustomPainter(),
                    ),
                  ),
                ),
                // Segunda capa (amarillo)
                Positioned(
                  top: height * 0.06,
                  child: Container(
                    height: height * 0.2,
                    width: width,
                    child: CustomPaint(
                      painter: RPSCustomPainter2(),
                    ),
                  ),
                ),
                // Tercera capa (rojo)
                Positioned(
                  top: height * 10,
                  child: Container(
                    height: height * 0.2,
                    width: width,
                    child: CustomPaint(
                      painter: RPSCustomPainter3(),
                    ),
                  ),
                ),
                // Texto "Welcome Back" y los botones de "Sign in" y "Sign up"
                Positioned(
                  top: height * 0.10,
                  left: width * 0.05,
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.05,
                  right: width * 0.05,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Iniciar sesión',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Crear cuenta',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

  }
}
