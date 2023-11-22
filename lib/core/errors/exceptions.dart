import 'package:equatable/equatable.dart';

class ApiException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const ApiException({
    required this.message,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const ServerException({
    required this.message,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}

class DatabaseException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const DatabaseException({
    required this.message,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}

class SharedPreferencesException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const SharedPreferencesException({
    required this.message,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}

class ConnectionException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const ConnectionException({
    required this.message,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}

class CacheException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const CacheException({
    required this.message,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}
