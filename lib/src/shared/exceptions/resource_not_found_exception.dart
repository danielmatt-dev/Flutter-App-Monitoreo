class ResourceNotFoundException implements Exception {
  final String message;

  ResourceNotFoundException({required this.message});

  @override
  String toString() {
    return 'ResourceNotFoundException: $message';
  }

}

