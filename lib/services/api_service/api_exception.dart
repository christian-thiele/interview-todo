/// This is the exception thrown by the [ApiService] for when the API returns
/// a faulty error code (401, 404, 500, ...)
class ApiException {
  final int statusCode;
  final String message;

  ApiException({
    required this.statusCode,
    required this.message,
  });
}
