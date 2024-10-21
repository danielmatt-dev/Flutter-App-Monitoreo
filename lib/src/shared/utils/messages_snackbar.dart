class MessagesSnackbar {

  static const error = 'Error';
  static const errorPdf = 'Error al generar pdf';
  static const success = 'Éxito';
  static const updateSuccess = 'Actualización exitosa';
  static const signUpSuccess = 'Registro existoso';
  static const warning = 'Alerta';
  static const requiredField = 'Campo necesario';
  static const requiredResponse = 'Respuesta requerida';
  static const requiredPermission = 'Permiso requerido';
  static const requiredFields = 'Campos requeridos';
  static const formatError = 'Error de formato';

  static const messageInvalidField = ' no válido';
  static const messageConnectionError = 'Por favor, intentelo más tarde';
  static const messageSaveSuccess = 'Guardado correctamente';
  static const messageSelectedData = 'Por favor, escoja ';
  static const messageEmptyField = 'Por favor, rellene el campo';
  static const messageSignUpSuccess = 'Cuenta creada con éxito';
  static const messageBadCredentials = 'Correo o contraseñas incorrectas';
  static const messagePdfError = '';
  static const messagePdfSuccess = 'Pdf generado correctamente';
  static const messagePermission = 'Es necesario otorgar permisos de almacenamiento para continuar';
  static const messageRequiredFields = 'Por favor, rellene todos los campos';
  static const messageResetPasswordSuccess = 'Contraseña actualizada con éxito';
  static const messageCorreoNonValidate = 'El correo ingresado no es válido';
  static const messageFormatError = 'Los datos ingresados no cumplen con el formato esperado';

  static String getMessageSelectedData(String text) => '$messageSelectedData$text';

  static String getMessageInvalidField(String field) => '$field$messageInvalidField';

}