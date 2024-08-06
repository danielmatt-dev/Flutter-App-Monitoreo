import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/direccion/presentation/bloc/direccion_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
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
  final TextEditingController _asentamientoController = TextEditingController();
  final TextEditingController _coloniaController = TextEditingController();
  final TextEditingController _ciudadController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _paisController = TextEditingController();
  final TextEditingController _calleController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _entreCalleUnoController = TextEditingController();
  final TextEditingController _entreCalleDosController = TextEditingController();
  String? _selectedValue;

  String codigoPostalHintText = 'Ingresa tu código postal (5 dígitos)';
  String calleHintText = 'Ingresa el nombre de tu calle';
  String numeroHintText = 'Ingresa el número de tu casa';
  String entreCalleUnoHintText = 'Ingresa la primera calle de referencia';
  String entreCalleDosHintText = 'Ingresa la segunda calle de referencia';

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

  bool _isFormValid() {
    return _ciudadController.text.isNotEmpty &&
        _estadoController.text.isNotEmpty &&
        _paisController.text.isNotEmpty &&
        _asentamientoController.text.isNotEmpty &&
        _selectedValue != null;
  }

  @override
  Widget build(BuildContext context) {

    void clearFields() {

      _codigoPostalController.clear();
      _coloniaController.clear();
      _ciudadController.clear();
      _estadoController.clear();
      _paisController.clear();
      _calleController.clear();
      _numeroController.clear();
      _entreCalleUnoController.clear();
      _entreCalleDosController.clear();
      _asentamientoController.clear();

      codigoPostalHintText = 'Ingresa tu código postal (5 dígitos)';
      calleHintText = 'Ingresa el nombre de tu calle';
      numeroHintText = 'Ingresa el número de tu casa';
      entreCalleUnoHintText = 'Ingresa la primera calle de referencia';
      entreCalleDosHintText = 'Ingresa la segunda calle de referencia';

      setState(() {
        _selectedValue = null;
      });

    }

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
                CustomSnackbar.show(
                    context: context,
                    typeMessage: TypeMessage.success,
                    title: 'Actualización exitosa',
                    description: 'La dirección se actualizó correctamente'
                );
                clearFields();
              }
              if(state.status.isSubmissionFailure){
                CustomSnackbar.show(
                  context: context,
                  typeMessage: TypeMessage.warning,
                  title: 'Alerta',
                  description: 'El código postal ingresado no existe',
                );
              }
              if (state.status.isValidated) {
                setState(() {
                  _ciudadController.text = state.ciudad;
                  _estadoController.text = state.estado;
                  _paisController.text = state.pais;
                  print(_paisController.text);
                });
              }
            },
            builder: (context, state) {

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFieldTitleCustom(
                      controller: _codigoPostalController,
                      labelText: 'Código postal',
                      hintText: 'Ingresa tu código postal (5 dígitos)',
                      isInvalid: state.status.isInvalid,
                      errorText: 'Código postal no válido',
                      onChanged: (value) => direccionBloc.add(CodePostalChanged(value)),
                      typeKeyboard: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                      ],
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    DropdownButtomTitle(
                      items: state.colonias.keys.toList(),
                      labelTitle: 'Colonias',
                      selectedValue: _selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedValue = value;
                          _coloniaController.text = value ?? '';
                          if (value != null && state.colonias.containsKey(value)) {
                            _asentamientoController.text = state.colonias[value]!;
                          } else {
                            _asentamientoController.text = '';
                          }
                        });
                      },
                      label: 'Selecciona tu colonia',
                      heightList: height*0.5,
                      heightButton: height*0.07,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    TextFieldTitleCustom(
                      controller: _asentamientoController,
                      labelText: 'Asentamiento',
                      enabled: false,
                      hintText: _asentamientoController.text.isNotEmpty
                          ? _asentamientoController.text
                          : 'Se llenará automáticamente',
                      hintOpacity: _asentamientoController.text.isEmpty ? 0.4 : 1,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    TextFieldTitleCustom(
                      controller: _calleController,
                      labelText: 'Calle (Opcional)',
                      hintText: 'Ingresa el nombre de tu calle',
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        LengthLimitingTextInputFormatter(150)
                      ],
                      maxLenght: 150,
                      typeKeyboard: TextInputType.text,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    TextFieldTitleCustom(
                      controller: _numeroController,
                      labelText: 'Número (Opcional)',
                      hintText: 'Ingresa el número de tu casa',
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(7),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      maxLenght: 7,
                      typeKeyboard: TextInputType.number,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    TextFieldTitleCustom(
                      controller: _entreCalleUnoController,
                      labelText: 'Entre calle 1 (Opcional)',
                      hintText: 'Ingresa la primera calle de referencia',
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        LengthLimitingTextInputFormatter(150)
                      ],
                      maxLenght: 150,
                      typeKeyboard: TextInputType.text,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    TextFieldTitleCustom(
                      controller: _entreCalleDosController,
                      labelText: 'Entre calle 2 (Opcional)',
                      hintText: 'Ingresa la segunda calle de referencia',
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        LengthLimitingTextInputFormatter(150)
                      ],
                      maxLenght: 150,
                      typeKeyboard: TextInputType.text,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    TextFieldTitleCustom(
                      controller: _ciudadController,
                      labelText: 'Ciudad',
                      enabled: false,
                      hintText: 'Se llenará automáticamente',
                      hintOpacity: _ciudadController.text.isEmpty ? 0.4 : 1,
                      onChanged: (value) {
                        if(state.status.isSubmissionSuccess){
                          setState(() {
                            value = '';
                            _ciudadController.text = '';
                          });
                        }
                        },
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    TextFieldTitleCustom(
                      controller: _estadoController,
                      labelText: 'Estado',
                      enabled: false,
                      hintText: 'Se llenará automáticamente',
                      hintOpacity: _estadoController.text.isEmpty ? 0.4 : 1,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    TextFieldTitleCustom(
                      controller: _paisController,
                      labelText: 'País',
                      enabled: false,
                      hintText: 'Se llenará automáticamente',
                      hintOpacity: _paisController.text.isEmpty ? 0.4 : 1,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.03),
                    IconButtonCustom(
                      onPressed: _isFormValid()
                          ? () {
                        FocusScope.of(context).unfocus();
                        direccionBloc.add(
                          ActualizarDireccionEvent(
                            codigoPostal: _codigoPostalController.text,
                            colonia: _coloniaController.text,
                            asentamiento: _asentamientoController.text,
                            calle: _calleController.text,
                            numero: _numeroController.text,
                            entreCalleUno: _entreCalleUnoController.text,
                            entreCalleDos: _entreCalleDosController.text,
                            ciudad: _ciudadController.text,
                            estado: _estadoController.text,
                            pais: _paisController.text,
                          ),
                        );
                      }
                      : null,
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