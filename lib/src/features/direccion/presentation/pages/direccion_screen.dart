import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/direccion/presentation/bloc/direccion_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/dropdown_buttom_title.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:app_plataforma/src/shared/widgets/icon_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// <>
class DireccionScreen extends StatefulWidget {

  const DireccionScreen({super.key});

  @override
  State<DireccionScreen> createState() => _DireccionScreenState();

}

class _DireccionScreenState extends State<DireccionScreen> {
  late DireccionBloc direccionBloc = sl<DireccionBloc>();

  final TextEditingController _codigoPostalController = TextEditingController();
  final TextEditingController _coloniaController = TextEditingController();
  final TextEditingController _ciudadController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _paisController = TextEditingController();
  final TextEditingController _calleController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _entreCalleUnoController = TextEditingController();
  final TextEditingController _entreCalleDosController = TextEditingController();
  String? _selectedValue;

  @override
  void dispose() {
    _codigoPostalController.dispose();
    _coloniaController.dispose();
    _ciudadController.dispose();
    _estadoController.dispose();
    _paisController.dispose();
    _calleController.dispose();
    _numeroController.dispose();
    _entreCalleUnoController.dispose();
    _entreCalleDosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const AppBarCustom(
        title: 'Actualizar dirección',
        center: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<DireccionBloc, DireccionFormState>(
            bloc: direccionBloc,
            listener: (context, state) {
              if (state.status.isSubmissionSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Dirección actualizada')),
                );
              }
              if (state.errorMessage.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              }
              if (state.status.isValidated || state.status.isSubmissionSuccess) {
                _ciudadController.text = state.ciudad;
                _estadoController.text = state.estado;
                _paisController.text = state.pais;
              }
            },
            builder: (context, state) {

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    FastTextFieldTitleCustom(
                      controller: _codigoPostalController,
                      labelText: 'Código postal',
                      hintText: 'Ingresa',
                      isInvalid: state.status.isInvalid,
                      errorText: 'Código postal no válido',
                      onChanged: (value) {
                        direccionBloc.add(CodePostalChanged(value));
                        if (state.codePostal.valid) {
                          FocusScope.of(context).unfocus();
                          direccionBloc.add(BuscarDireccion(value));
                        }
                      },
                      typeKeyboard: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                      ],
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    DropdownButtomTitle(
                      items: state.colonias,
                      labelTitle: 'Colonias',
                      selectedValue: _selectedValue,
                      onChanged: (String? value) {
                        _selectedValue = value;
                      },
                      label: 'Selecciona tu colonia',
                      heightList: height*0.5,
                      heightButton: height*0.07,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    FastTextFieldTitleCustom(
                      controller: _calleController,
                      labelText: 'Calle',
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    FastTextFieldTitleCustom(
                      controller: _numeroController,
                      labelText: 'Número',
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    FastTextFieldTitleCustom(
                      controller: _entreCalleUnoController,
                      labelText: 'Entre calle 1',
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    FastTextFieldTitleCustom(
                      controller: _entreCalleDosController,
                      labelText: 'Entre calle 2',
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    FastTextFieldTitleCustom(
                      controller: _ciudadController,
                      labelText: 'Ciudad',
                      enabled: false
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    FastTextFieldTitleCustom(
                      controller: _estadoController,
                      labelText: 'Estado',
                      enabled: false
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    FastTextFieldTitleCustom(
                      controller: _paisController,
                      labelText: 'País',
                      enabled: false
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.03),
                    IconButtonCustom(
                      onPressed: state.status.isInvalid
                        ? () {
                        FocusScope.of(context).unfocus();
                        direccionBloc.add(
                          ActualizarDireccionEvent(
                            codigoPostal: _codigoPostalController.text,
                            colonia: _coloniaController.text,
                            asentamiento: _selectedValue!,
                            calle: _calleController.text,
                            numero: _numeroController.text,
                            entreCalleUno: _entreCalleUnoController.text,
                            entreCalleDos: _entreCalleDosController.text,
                            ciudad: _ciudadController.text,
                            estado: _estadoController.text,
                            pais: _paisController.text,
                          ),
                        );
                      } : null,
                      text: 'Actualizar',
                      color: colorScheme.primary,
                      icon: Icons.lock_reset_rounded,
                      horizontal: 0,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}