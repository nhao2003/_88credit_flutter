import 'package:equatable/equatable.dart';
import 'package:_88credit_flutter/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;

  String get errorMessage => '$statusCode - Error: $message';

  @override
  List<Object?> get props => [message, statusCode];
}

class ApiFailure extends Failure {
  const ApiFailure({
    required String message,
    required int statusCode,
  }) : super(
          message: message,
          statusCode: statusCode,
        );

  ApiFailure.fromException(
    ApiException exception,
  ) : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}

class ServerFailure extends Failure {
  const ServerFailure({
    required String message,
    required int statusCode,
  }) : super(
          message: message,
          statusCode: statusCode,
        );

  ServerFailure.fromException(
    ServerException exception,
  ) : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({
    required String message,
    required int statusCode,
  }) : super(
          message: message,
          statusCode: statusCode,
        );

  ConnectionFailure.fromException(
    ServerException exception,
  ) : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({
    required String message,
    required int statusCode,
  }) : super(
          message: message,
          statusCode: statusCode,
        );

  DatabaseFailure.fromException(
    ServerException exception,
  ) : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}

class SharedPreferencesFailure extends Failure {
  const SharedPreferencesFailure({
    required String message,
    required int statusCode,
  }) : super(
          message: message,
          statusCode: statusCode,
        );

  SharedPreferencesFailure.fromException(
    ServerException exception,
  ) : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}

class CacheFailure extends Failure {
  const CacheFailure({
    required String message,
    required int statusCode,
  }) : super(
          message: message,
          statusCode: statusCode,
        );

  CacheFailure.fromException(
    ServerException exception,
  ) : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}
