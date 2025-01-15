class ErrorOBj {
  String type;
  String message;

  ErrorOBj({
    required this.type,
    required this.message,
  });

  @override
  String toString() {
    return """
            type: $type. 
            message: $message)
            """;
  }
}
