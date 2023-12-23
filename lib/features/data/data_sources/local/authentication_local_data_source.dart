import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/exceptions.dart';

abstract class AuthenLocalDataSrc {
  Future<void> storeRefreshToken(String refreshToken);
  Future<void> storeAccessToken(String accessToken);
  String? getRefreshToken();
  String? getAccessToken();
  Future<void> deleteRefreshToken();
  Future<void> deleteAccessToken();
  String? getUserIdFromToken();
}

class AuthenLocalDataSrcImpl implements AuthenLocalDataSrc {
  late SharedPreferences client;
  AuthenLocalDataSrcImpl(this.client);

  @override
  String? getAccessToken() {
    try {
      String? token = client.getString('accessToken');
      if (token != null) {
        return token;
      } else {
        return "";
      }
    } catch (error) {
      throw SharedPreferencesException(
          message: error.toString(), statusCode: 500);
    }
  }

  @override
  String? getRefreshToken() {
    try {
      String? token = client.getString('refreshToken');
      if (token != null) {
        return token;
      } else {
        return "";
      }
    } catch (error) {
      throw SharedPreferencesException(
          message: error.toString(), statusCode: 500);
    }
  }

  @override
  Future<void> storeAccessToken(String accessToken) async {
    try {
      await client.setString('accessToken', accessToken);
    } catch (error) {
      throw SharedPreferencesException(
          message: error.toString(), statusCode: 500);
    }
  }

  @override
  Future<void> storeRefreshToken(String refreshToken) async {
    try {
      await client.setString('refreshToken', refreshToken);
    } catch (error) {
      throw SharedPreferencesException(
          message: error.toString(), statusCode: 500);
    }
  }

  @override
  Future<void> deleteAccessToken() async {
    try {
      await client.remove("accessToken");
    } catch (error) {
      throw SharedPreferencesException(
          message: error.toString(), statusCode: 500);
    }
  }

  @override
  Future<void> deleteRefreshToken() async {
    try {
      await client.remove("refreshToken");
    } catch (error) {
      throw SharedPreferencesException(
          message: error.toString(), statusCode: 500);
    }
  }

  @override
  String? getUserIdFromToken() {
    try {
      String? token = client.getString('accessToken');
      if (JwtDecoder.isExpired(token!)) {
        throw const SharedPreferencesException(
            message: "Token is expired", statusCode: 500);
      }
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      return decodedToken["user_id"];
    } catch (error) {
      throw SharedPreferencesException(
          message: error.toString(), statusCode: 500);
    }
  }
}
