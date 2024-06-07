part of 'api_service_impl.dart';

class ApiToken {
  final String token;
  final DateTime issuedAt;

  ApiToken._(
    this.token,
    this.issuedAt,
  );
}
