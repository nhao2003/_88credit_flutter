import 'dart:io';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/features/domain/repository/authentication_repository.dart';
import '../data_sources/local/authentication_local_data_source.dart';
import '../data_sources/remote/authentication_remote_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenRemoteDataSrc _dataRemoteSrc;
  final AuthenLocalDataSrc _dataLocalSrc;

  AuthenticationRepositoryImpl(this._dataRemoteSrc, this._dataLocalSrc);

  @override
  Future<DataState<void>> signIn(String email, String password) async {
    try {
      final httpResponse = await _dataRemoteSrc.login(email, password);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        String accessToken = httpResponse.data['accessToken']!;
        String refreshToken = httpResponse.data['refreshToken']!;
        _dataLocalSrc.storeAccessToken(accessToken);
        _dataLocalSrc.storeRefreshToken(refreshToken);
        return const DataSuccess(null);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<bool>> checkActiveToken() async {
    try {
      String? accessToken = _dataLocalSrc.getAccessToken();
      if (accessToken != "" && JwtDecoder.isExpired(accessToken!) == false) {
        return const DataSuccess(true);
      }
      return const DataSuccess(false);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<bool>> checkRefreshToken() async {
    try {
      String? refreshToken = _dataLocalSrc.getRefreshToken();
      if (refreshToken != "" && JwtDecoder.isExpired(refreshToken!) == false) {
        return const DataSuccess(true);
      }
      return const DataSuccess(false);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<void>> refreshNewAccessToken() async {
    try {
      final refreshToken = _dataLocalSrc.getRefreshToken();
      final httpResponse = await _dataRemoteSrc.refreshToken(refreshToken!);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        String accessToken = httpResponse.data;
        _dataLocalSrc.storeAccessToken(accessToken);
        return const DataSuccess(null);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<void>> signOut() async {
    try {
      final httpResponse = await _dataRemoteSrc.signOut();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        _dataLocalSrc.deleteAccessToken();
        _dataLocalSrc.deleteRefreshToken();
        return const DataSuccess(null);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<String>> signUp(
      String email, String password, String confirmPassword) async {
    try {
      final httpResponse =
          await _dataRemoteSrc.signUp(email, password, confirmPassword);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        String otp = httpResponse.data;
        return DataSuccess(otp);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<String>> getUserId() async {
    try {
      String? id = _dataLocalSrc.getUserIdFromToken();
      return DataSuccess(id);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<String>> getAccessToken() async {
    final accessToken = _dataLocalSrc.getAccessToken();
    return DataSuccess(accessToken);
  }
}
