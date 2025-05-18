

class TodoDataSourceException implements Exception {
  final String message;
  final dynamic underlyingException;

  const TodoDataSourceException(this.message, [this.underlyingException]);

  @override
  String toString() {
    if(underlyingException != null) {
      return "TodoDataSourceException $message caused by $underlyingException";
    }
    return "TodoDataSourceException $message";
  }
}
