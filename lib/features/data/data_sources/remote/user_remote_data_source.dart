import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/resources/pair.dart';
import '../../../../core/utils/query_builder.dart';
import '../../../../injection_container.dart';
import '../../models/credit/user.dart';
import '../local/authentication_local_data_source.dart';

abstract class UserRemoteDataSrc {
  Future<HttpResponse<Pair<int, List<UserModel>>>> searchUsers(
      String query, int page);
  Future<HttpResponse<UserModel>> getProfile();
}

class UserRemoteDataSrcImpl extends UserRemoteDataSrc {
  final Dio client;

  UserRemoteDataSrcImpl(this.client);

  @override
  Future<HttpResponse<Pair<int, List<UserModel>>>> searchUsers(
      String query, int page) {
    String url = '$apiUrl$kGetUserEndpoint';

    QueryBuilder queryBuilder = QueryBuilder();
    queryBuilder.addPage(page);

    if (query.trim().isNotEmpty) {
      url += '?search=$query';
    }

    url += queryBuilder.build();
    try {
      return client.get(url).then((response) {
        List<UserModel> users = [];
        if (response.data['result'] != null) {
          users = (response.data['result'] as List<dynamic>? ?? [])
              .map((e) => UserModel.fromJson(e))
              .toList();
        }

        return HttpResponse<Pair<int, List<UserModel>>>(
          Pair(response.data['num_of_pages'], users),
          response,
        );
      });
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }

  @override
  Future<HttpResponse<UserModel>> getProfile() async {
    String url = '$apiUrl$kGetMe';
    print(url);
    try {
      // get access token
      AuthenLocalDataSrc localDataSrc = sl<AuthenLocalDataSrc>();
      String? accessToken = localDataSrc.getAccessToken();
      if (accessToken == null) {
        throw const ApiException(
            message: 'Access token is null', statusCode: 505);
      }

      final response = await client.get(
        url,
        options: Options(
            sendTimeout: const Duration(seconds: 10),
            headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.data['message'],
          statusCode: response.statusCode!,
        );
      }

      UserModel user = UserModel.fromJson(response.data['result']);

      return HttpResponse<UserModel>(
        user,
        response,
      );
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }
}
