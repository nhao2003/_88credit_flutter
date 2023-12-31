import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/resources/pair.dart';
import '../../../../core/utils/query_builder.dart';
import '../../models/credit/user.dart';

abstract class UserRemoteDataSrc {
  Future<HttpResponse<Pair<int, List<UserModel>>>> searchUsers(
      String query, int page);
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
}
