import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:_88credit_flutter/core/constants/constants.dart';
import '../../../domain/entities/credit/post.dart';
import '../db/database_helper.dart';

abstract class PostRemoteDataSrc {
  Future<HttpResponse<List<PostEntity>>> getAllPosts(String? userId);
  Future<HttpResponse<List<PostEntity>>> getPostsApproved();
  Future<HttpResponse<List<PostEntity>>> getPostsHided();
  Future<HttpResponse<List<PostEntity>>> getPostsPending();
  Future<HttpResponse<List<PostEntity>>> getPostsRejected();
}

class PostRemoteDataSrcImpl implements PostRemoteDataSrc {
  final Dio client;

  PostRemoteDataSrcImpl(this.client);

  @override
  Future<HttpResponse<List<PostEntity>>> getAllPosts(String? userId) async {
    var url = '$apiUrl$kGetPostEndpoint';
    if (userId != null) url += '?post_user_id[eq]=\'$userId\'';
    return await DatabaseHelper().getPosts(url, client);
  }

  @override
  Future<HttpResponse<List<PostEntity>>> getPostsApproved() async {
    const status = 'approved';
    const url = '$apiUrl$kGetPostEndpoint?post_status[eq]=\'$status\'';

    return await DatabaseHelper().getPosts(url, client);
  }

  @override
  Future<HttpResponse<List<PostEntity>>> getPostsHided() async {
    const status = 'hided';
    const url = '$apiUrl$kGetPostEndpoint?post_status[eq]=\'$status\'';

    return await DatabaseHelper().getPosts(url, client);
  }

  @override
  Future<HttpResponse<List<PostEntity>>> getPostsPending() async {
    const status = 'pending';
    const url = '$apiUrl$kGetPostEndpoint?post_status[eq]=\'$status\'';
    return await DatabaseHelper().getPosts(url, client);
  }

  @override
  Future<HttpResponse<List<PostEntity>>> getPostsRejected() async {
    const status = 'rejected';
    const url = '$apiUrl$kGetPostEndpoint?post_status[eq]=\'$status\'';

    return await DatabaseHelper().getPosts(url, client);
  }
}
