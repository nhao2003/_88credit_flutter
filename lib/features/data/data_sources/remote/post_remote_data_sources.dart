import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:_88credit_flutter/core/constants/constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/resources/pair.dart';
import '../../../../core/utils/query_builder.dart';
import '../../../../core/utils/typedef.dart';
import '../../../../injection_container.dart';
import '../../../domain/entities/credit/post.dart';
import '../../../domain/enums/post_type.dart';
import '../../models/credit/post.dart';
import '../db/database_helper.dart';
import '../local/authentication_local_data_source.dart';

abstract class PostRemoteDataSrc {
  Future<HttpResponse<Pair<int, List<PostEntity>>>> getAllPosts(
      String? userId, PostTypes? postTypes, int? page);
  Future<HttpResponse<Pair<int, List<PostEntity>>>> getPostsStatus(
      String status, int? page);
  Future<HttpResponse<Pair<int, List<PostEntity>>>> getPostsHided(int? page);
  Future<HttpResponse<Pair<int, List<PostEntity>>>> getPostsExpired(int? page);

  Future<HttpResponse<void>> createPost(PostModel post);
}

class PostRemoteDataSrcImpl implements PostRemoteDataSrc {
  final Dio client;

  PostRemoteDataSrcImpl(this.client);

  @override
  Future<HttpResponse<Pair<int, List<PostEntity>>>> getAllPosts(
      String? userId, PostTypes? postTypes, int? page) async {
    var url = '$apiUrl$kGetPostEndpoint';

    QueryBuilder queryBuilder = QueryBuilder();
    int pageQuery = page ?? 1;
    queryBuilder.addPage(pageQuery);

    if (userId != null) {
      queryBuilder.addQuery('post_user_id', Operation.equals, '\'$userId\'');
    }

    if (postTypes != null) {
      queryBuilder.addQuery(
          'post_type', Operation.equals, '\'${postTypes.toString()}\'');
    }

    queryBuilder.addOrderBy('updated_at', OrderBy.desc);

    url += queryBuilder.build();
    return await DatabaseHelper().getPosts(url, client);
  }

  @override
  Future<HttpResponse<Pair<int, List<PostEntity>>>> getPostsStatus(
      String status, int? page) async {
    int pageQuery = page ?? 1;
    QueryBuilder queryBuilder = QueryBuilder();
    queryBuilder.addPage(pageQuery);
    queryBuilder.addQuery('post_status', Operation.equals, '\'$status\'');
    queryBuilder.addOrderBy('updated_at', OrderBy.desc);

    String url = '$apiUrl$kGetPostEndpoint${queryBuilder.build()}';

    return await DatabaseHelper().getPosts(url, client);
  }

  @override
  Future<HttpResponse<Pair<int, List<PostEntity>>>> getPostsHided(
      int? page) async {
    int pageQuery = page ?? 1;

    QueryBuilder queryBuilder = QueryBuilder();
    queryBuilder.addPage(pageQuery);
    queryBuilder.addOrderBy('updated_at', OrderBy.desc);

    String url = '$apiUrl$kGetPostEndpoint${queryBuilder.build()}';

    return await DatabaseHelper().getPosts(url, client);
  }

  @override
  Future<HttpResponse<Pair<int, List<PostEntity>>>> getPostsExpired(
      int? page) async {
    int pageQuery = page ?? 1;
    String url = '$apiUrl$kGetPostEndpoint?page=$pageQuery';

    try {
      final response = await client.get(url);
      //print('${response.statusCode} : ${response.data["message"].toString()}');
      if (response.statusCode != 200) {
        //print('${response.statusCode} : ${response.data["result"].toString()}');
        throw ApiException(
          message: response.data,
          statusCode: response.statusCode!,
        );
      }

      final int numOfPages = response.data["num_of_pages"];

      final List<DataMap> taskDataList =
          List<DataMap>.from(response.data["result"]);

      List<PostEntity> posts = taskDataList
          .map((postJson) => PostEntity.fromJson(postJson))
          //.where((post) => post.isActive!)
          //.where((post) => post.expiryDate!.isBefore(DateTime.now()))
          .toList();

      final value = Pair(numOfPages, posts);

      return HttpResponse(value, response);
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }

  @override
  Future<HttpResponse<void>> createPost(PostModel post) async {
    const url = '$apiUrl$kCreatePostEndpoint';
    try {
      // get access token
      AuthenLocalDataSrc localDataSrc = sl<AuthenLocalDataSrc>();
      String? accessToken = localDataSrc.getAccessToken();
      if (accessToken == null) {
        throw const ApiException(
            message: 'Access token is null', statusCode: 505);
      }

      // Gửi yêu cầu đến server
      print(post.toJson());

      final response = await client.post(
        url,
        options: Options(
            sendTimeout: const Duration(seconds: 10),
            headers: {'Authorization': 'Bearer $accessToken'}),
        data: post.toJson(),
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.data['message'],
          statusCode: response.statusCode!,
        );
      }

      // Nếu yêu cầu thành công, giải mã dữ liệu JSON
      return HttpResponse(null, response);
    } on DioException catch (e) {
      throw ApiException(
        message: e.message ?? "Error when create post",
        statusCode: e.response?.statusCode ?? 505,
      );
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }
}
