import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/direccion/presentation/bloc/direccion_bloc.dart';
import 'package:app_plataforma/src/features/direccion/presentation/widgets/dropdown_items.dart';
import 'package:app_plataforma/src/features/direccion/presentation/widgets/text_field_custom.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/icon_button_custom.dart';
import 'package:flutter/material.dart';
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

  @override
  void dispose() {
    _codigoPostalController.dispose();
    _coloniaController.dispose();
    _ciudadController.dispose();
    _estadoController.dispose();
    _paisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const AppBarCustom(
        title: 'Actualizar dirección',
        center: true,),
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
                    TextFieldCustom(
                      controller: _codigoPostalController,
                      labelText: 'Código postal',
                      isInvalid: state.status.isInvalid,
                      errorText: 'Código postal no válido',
                      onChanged: (value) {
                        direccionBloc.add(CodePostalChanged(value));
                        if (value.length == 5 && state.codePostal.valid) {
                          FocusScope.of(context).unfocus();
                          direccionBloc.add(BuscarDireccion(value));
                        }
                      },
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    if (state.colonias.isNotEmpty)
                      DropdownItems(
                        items: state.colonias,
                        label: 'Colonia',
                        selectedItem: state.colonias.first,
                        onChanged: (value) {
                          direccionBloc.add(ColoniaSelected(value!));
                          _coloniaController.text = value;
                        },
                      ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    TextFieldCustom(
                      controller: _ciudadController,
                      labelText: 'Ciudad',
                      enabled: false,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    TextFieldCustom(
                      controller: _estadoController,
                      labelText: 'Estado',
                      enabled: false,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    TextFieldCustom(
                      controller: _paisController,
                      labelText: 'País',
                      enabled: false,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    IconButtonCustom(
                      onPressed: () {
                        FocusScope.of(context).unfocus();  // Ocultar el teclado
                        direccionBloc.add(
                          ActualizarDireccionEvent(
                            codigoPostal: _codigoPostalController.text,
                            colonia: _coloniaController.text,
                            asentamiento: '',
                            calle: '',
                            numero: '',
                            entreCalleUno: '',
                            entreCalleDos: '',
                            ciudad: _ciudadController.text,
                            estado: _estadoController.text,
                            pais: _paisController.text,
                          ),
                        );
                      },
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