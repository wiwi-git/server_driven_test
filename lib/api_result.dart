class ApiResult<T> {
  bool success;
  int statusCode;
  T? body;
  Map<String, String> headers;

  // Error? error;

  ApiResult({
    required this.success,
    required this.statusCode,
    required this.headers,
    this.body,
    // this.error,
  });
}
