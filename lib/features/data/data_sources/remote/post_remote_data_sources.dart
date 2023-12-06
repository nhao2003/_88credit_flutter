import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:_88credit_flutter/core/constants/constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/typedef.dart';
import '../../models/nhagiare/post/real_estate_post.dart';
import '../db/database_helper.dart';

abstract class PostRemoteDataSrc {
  Future<HttpResponse<List<RealEstatePostModel>>> getAllPosts(String? userId);
  Future<HttpResponse<List<RealEstatePostModel>>> getPostsApproved();
  Future<HttpResponse<List<RealEstatePostModel>>> getPostsHided();
  Future<HttpResponse<List<RealEstatePostModel>>> getPostsPending();
  Future<HttpResponse<List<RealEstatePostModel>>> getPostsRejected();
  Future<HttpResponse<List<RealEstatePostModel>>> getPostsExpired();
}

class PostRemoteDataSrcImpl implements PostRemoteDataSrc {
  final Dio client;

  PostRemoteDataSrcImpl(this.client);

  @override
  Future<HttpResponse<List<RealEstatePostModel>>> getAllPosts(
      String? userId) async {
    var url = '$apiUrl$kGetPostEndpoint';
    if (userId != null) url += '?post_user_id[eq]=\'$userId\'';
    return await DatabaseHelper().getPosts(url, client);
  }

  @override
  Future<HttpResponse<List<RealEstatePostModel>>> getPostsApproved() async {
    const status = 'approved';
    const url = '$apiUrl$kGetPostEndpoint?post_status[eq]=\'$status\'';

    return await DatabaseHelper().getPosts(url, client);
  }

  @override
  Future<HttpResponse<List<RealEstatePostModel>>> getPostsExpired() async {
    const url = '$apiUrl$kGetPostEndpoint';

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

      final List<DataMap> taskDataList =
          List<DataMap>.from(response.data["result"]);

      List<RealEstatePostModel> value = taskDataList
          .map((postJson) => RealEstatePostModel.fromJson(postJson))
          .where((post) => post.isActive!)
          .where((post) => post.expiryDate!.isBefore(DateTime.now()))
          .toList();

      return HttpResponse(value, response);
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }

  @override
  Future<HttpResponse<List<RealEstatePostModel>>> getPostsHided() async {
    const status = 'hided';
    const url = '$apiUrl$kGetPostEndpoint?post_status[eq]=\'$status\'';

    return await DatabaseHelper().getPosts(url, client);
  }

  @override
  Future<HttpResponse<List<RealEstatePostModel>>> getPostsPending() async {
    const status = 'pending';
    const url = '$apiUrl$kGetPostEndpoint?post_status[eq]=\'$status\'';
    return await DatabaseHelper().getPosts(url, client);
  }

  @override
  Future<HttpResponse<List<RealEstatePostModel>>> getPostsRejected() async {
    const status = 'rejected';
    const url = '$apiUrl$kGetPostEndpoint?post_status[eq]=\'$status\'';

    return await DatabaseHelper().getPosts(url, client);
  }
}
