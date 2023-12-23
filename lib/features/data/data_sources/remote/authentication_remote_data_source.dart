import 'package:dio/dio.dart';
import 'package:_88credit_flutter/features/data/data_sources/local/authentication_local_data_source.dart';
import 'package:_88credit_flutter/injection_container.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/typedef.dart';

abstract class AuthenRemoteDataSrc {
  Future<HttpResponse<Map<String, String>>> login(
      String email, String password);
  Future<HttpResponse<String>> signUp(
      String email, String password, String confirmPassword);
  Future<HttpResponse<void>> changePassword(
      String oldPassword, String newPassword, String confirmNewPassword);
  Future<HttpResponse<void>> signOut();
  Future<HttpResponse<void>> signOutAll();
  Future<HttpResponse<void>> activeAccount(
      String email, String password, String code);
  Future<HttpResponse<void>> resendOTP(String email);
  Future<HttpResponse<String>> refreshToken(String refreshToken);
}

class AuthenRemoteDataSrcImpl implements AuthenRemoteDataSrc {
  final Dio client;

  AuthenRemoteDataSrcImpl(this.client);

  @override
  Future<HttpResponse<void>> activeAccount(
      String email, String password, String code) async {
    // TODO: implement activeAccount
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<void>> changePassword(
      String oldPassword, String newPassword, String confirmNewPassword) async {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<Map<String, String>>> login(
      String email, String password) async {
    const url = '$apiUrl$kSignIn';
    print('url: $url');
    print('email: $email');
    print('password: $password');
    try {
      // Gửi yêu cầu đăng nhập
      final response = await client.post(
        url,
        data: {'email': email, 'password': password},
      );
      if (response.statusCode != 200) {
        throw ApiException(
          message: response.data,
          statusCode: response.statusCode!,
        );
      }

      // Nếu yêu cầu thành công, giải mã dữ liệu JSON
      final DataMap data = DataMap.from(response.data["result"]);

      // Lấy AccessToken và RefreshToken từ dữ liệu giải mã
      String accessToken = data['access_token'];
      String refreshToken = data['refresh_token'];

      // Trả về AccessToken và RefreshToken
      Map<String, String> value = {
        'accessToken': accessToken,
        'refreshToken': refreshToken
      };

      return HttpResponse(value, response);
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }

  @override
  Future<HttpResponse<String>> refreshToken(String refreshToken) async {
    const url = '$apiUrl$kRefreshToken';
    try {
      AuthenLocalDataSrc localDataSrc = sl<AuthenLocalDataSrc>();
      String? refreshToken = localDataSrc.getRefreshToken();
      // get new access token
      final response = await client.get(url, data: {
        "refresh_token": refreshToken,
      });
      if (response.statusCode != 200) {
        throw ApiException(
          message: response.data,
          statusCode: response.statusCode!,
        );
      }

      // Nếu yêu cầu thành công, giải mã dữ liệu JSON
      final DataMap data = DataMap.from(response.data["result"]);

      // Lấy AccessToken và RefreshToken từ dữ liệu giải mã
      String accessToken = data['access_token'];

      return HttpResponse(accessToken, response);
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }

  @override
  Future<HttpResponse<void>> resendOTP(String email) async {
    // TODO: implement resendOTP
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<void>> signOut() async {
    const url = '$apiUrl$kSignOut';
    try {
      // get access token
      AuthenLocalDataSrc localDataSrc = sl<AuthenLocalDataSrc>();
      String? accessToken = localDataSrc.getAccessToken();
      // Gửi yêu cầu đăng xuat
      final response = await client.post(
        url,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode != 200) {
        throw ApiException(
          message: response.data,
          statusCode: response.statusCode!,
        );
      }

      return HttpResponse(null, response);
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }

  @override
  Future<HttpResponse<void>> signOutAll() async {
    // TODO: implement signOutAll
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<String>> signUp(
      String email, String password, String confirmPassword) async {
    const url = '$apiUrl$kSignUp';
    try {
      // Gửi yêu cầu đăng ky
      final response = await client.post(
        url,
        options: Options(sendTimeout: const Duration(seconds: 10)),
        data: {
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword
        },
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.data['message'],
          statusCode: response.statusCode!,
        );
      }

      // Nếu yêu cầu thành công, giải mã dữ liệu JSON
      final DataMap data = DataMap.from(response.data["result"]);

      String otpCode = data['otp_code'];

      return HttpResponse(otpCode, response);
    } on DioException catch (e) {
      throw ApiException(
        message: e.message!,
        statusCode: e.response?.statusCode ?? 505,
      );
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }
}
