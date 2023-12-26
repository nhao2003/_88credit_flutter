import 'dart:io';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../core/resources/data_state.dart';
import '../../domain/repository/authentication_repository.dart';
import '../data_sources/local/authentication_local_data_source.dart';
import '../data_sources/remote/authentication_remote_data_source.dart';
import '../models/credit/user.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenRemoteDataSrc _dataRemoteSrc;
  final AuthenLocalDataSrc _dataLocalSrc;

  AuthenticationRepositoryImpl(this._dataRemoteSrc, this._dataLocalSrc);

  bool _isLoggedIn = false;

  @override
  Future<DataState<void>> signIn(String email, String password) async {
    try {
      final httpResponse = await _dataRemoteSrc.login(email, password);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        String accessToken = httpResponse.data['accessToken']!;
        String refreshToken = httpResponse.data['refreshToken']!;
        _dataLocalSrc.storeAccessToken(accessToken);
        _dataLocalSrc.storeRefreshToken(refreshToken);
        isLoggedIn = true;
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
  DataState<bool> checkActiveToken() {
    try {
      String? accessToken = _dataLocalSrc.getAccessToken();
      if (accessToken != "" &&
          JwtDecoder.isExpired(accessToken ?? "") == false) {
        return const DataSuccess(true);
      }
      return const DataSuccess(false);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  DataState<bool> checkRefreshTokenIsValid() {
    try {
      String? refreshToken = _dataLocalSrc.getRefreshToken();
      if (refreshToken != "" &&
          JwtDecoder.isExpired(refreshToken ?? "") == false) {
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
        isLoggedIn = true;
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
    } catch (e) {
      return DataFailed(DioException(
        error: e.toString(),
        type: DioExceptionType.badCertificate,
        requestOptions: RequestOptions(path: ""),
      ));
    }
  }

  @override
  Future<DataState<void>> signOut() async {
    try {
      final httpResponse = await _dataRemoteSrc.signOut();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        _dataLocalSrc.deleteAccessToken();
        _dataLocalSrc.deleteRefreshToken();
        isLoggedIn = false;
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
  DataState<String> getUserId() {
    try {
      String id = _dataLocalSrc.getUserIdFromToken();
      return DataSuccess(id);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  DataState<String> getAccessToken() {
    final accessToken = _dataLocalSrc.getAccessToken();
    return DataSuccess(accessToken);
  }

  final List<Function(bool p1)> _authListeners = [];

  @override
  void addAuthStateListener(Function(bool p1) listener) {
    _authListeners.add(listener);
  }

  @override
  void removeAuthStateListener(Function(bool p1) listener) {
    _authListeners.remove(listener);
  }

  @override
  void notifyAuthStateListeners() {
    for (var listener in _authListeners) {
      listener(_isLoggedIn);
    }
  }

  @override
  bool get isLoggedIn => _isLoggedIn;

  @override
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyAuthStateListeners();
  }

  @override
  Future<DataState<void>> signInWithToken() async {
    final refreshToken = _dataLocalSrc.getRefreshToken();
    if (JwtDecoder.isExpired(refreshToken ?? "") == false) {
      final result = await refreshNewAccessToken();
      if (result is DataSuccess) {
        isLoggedIn = true;
        return const DataSuccess(null);
      } else {
        return DataFailed(DioException(
          error: "Refresh token is invalid",
          type: DioExceptionType.badCertificate,
          requestOptions: RequestOptions(path: ""),
        ));
      }
    } else {
      return DataFailed(DioException(
        error: "Refresh token is invalid",
        type: DioExceptionType.badCertificate,
        requestOptions: RequestOptions(path: ""),
      ));
    }
  }

  @override
  Future<DataState<UserModel>> getMe() async {
    try {
      final httpResponse = await _dataRemoteSrc.getMe();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
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
}
