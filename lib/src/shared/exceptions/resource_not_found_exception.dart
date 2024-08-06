class ResourceNotFoundException implements Exception {

  final String message;

  ResourceNotFoundException({required this.message});

}

class BadRequestException implements Exception {

  final String message;

  BadRequestException({required this.message});

}
