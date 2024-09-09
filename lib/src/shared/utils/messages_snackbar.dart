class MessagesSnackbar {

  static const error = 'Error';
  static const success = 'Éxito';
  static const updateSuccess = 'Actualización exitosa';
  static const signUpSuccess = 'Registro existoso';
  static const warning = 'Alerta';
  static const requiredField = 'Campo necesario';
  static const requiredResponse = 'Respuesta requerida';

  static const messageInvalidField = ' no válido';
  static const messageConnectionError = 'Por favor, intentelo más tarde';
  static const messageSaveSuccess = 'Guardado correctamente';
  static const messageSelectedData = 'Por favor, escoja ';
  static const messageSignUpSuccess = 'Cuenta creada con éxito';

  static String getMessageSelectedData(String text) => '$messageSelectedData$text';

  static String getMessageInvalidField(String field) => '$field$messageInvalidField';

}